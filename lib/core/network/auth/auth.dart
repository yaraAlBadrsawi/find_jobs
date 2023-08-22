import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/core/network/auth/user_operation.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import '../../model/base_model.dart';
import '../../model/user.dart';
import '../../resources/colors_mangaer.dart';
import '../../resources/routes_manager.dart';
import '../../storage/local/app_settings_shared_preferences.dart';
import '../../storage/local/hive_data_store/hive_data_store.dart';
import '../../storage/secure_storage/secure_storage.dart';
import '../../widget/loading.dart';

FirebaseResponse _controlFirebaseException(FirebaseAuthException exception) {
  print('Message: ${exception.message}');
  if (exception.code == 'email-already-in-use') {
    //
  } else if (exception.code == 'invalid-email') {
    //
  } else if (exception.code == 'operation-not-allowed') {
    //
  } else if (exception.code == 'weak-password') {
    //
  } else if (exception.code == 'user-disabled') {
    //
  } else if (exception.code == 'user-not-found') {
    //
  } else if (exception.code == 'wrong-password') {
    //
  } else if (exception.code == 'auth/invalid-email') {
    //
  } else if (exception.code == 'auth/user-not-found') {
    //
  }
  return FirebaseResponse(
      message: exception.message ?? 'Error occurred', status: false);
}

class Authenticate {
  final FirebaseAuth _auth = FirebaseAuth.instance;

// signUpWithEmailAndPassword
  Future<FirebaseResponse> signUpWithEmailAndPassword(
      {required UserModel user, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: user.email, password: password);

      if (userCredential.user != null) {
        UserModel newUser = UserModel(
          userID: userCredential.user!.uid,
          email: userCredential.user!.email!,
          name: user.name,
          userType: user.userType,
        );

        bool isSavedToDB = await UsersDB.addAllUserInDB(newUser);

        // ask usr if want to save data or not ?
        // if user said yes => go to login and make login to save Data in Hive

        // if user said no => go to home page and when back to app again go to login screen and in their he can save his data in Hive by Remember me

        //   if (isSavedToDB) {
        /// save data in SecureStorage
        print('Is data saved done ?? $isSavedToDB ');
        // UserModel? userModel= await UsersDB.getCurrentUser(userCredential.user!.uid);
        // HiveService().addItem( StringsManager.user,  userModel);
        // HiveService().addItem( StringsManager.user,  userModel);

        // if(userModel!=null){
        // // print( 'HIVE DATA => ${ HiveService().getUser(key: StringsManager.user)} ');
        //
        //   // Authenticate()._saveUserDataInSecureStorage(userModel, password);
        //
        // }
        // }
        await userCredential.user!.sendEmailVerification();

        return FirebaseResponse(
          message: StringsManager.accountCreatedSuccessfully,
          status: true,
        );
      }

      return FirebaseResponse(
          message: StringsManager.cantSignUp, status: false);
    } on FirebaseAuthException catch (error) {
      debugPrint('$error${error.stackTrace}');
      return _controlFirebaseException(error);
    } catch (e, s) {
      debugPrint('FireStoreUtils.signUpWithEmailAndPassword $e $s');
      return FirebaseResponse(
          message: '${StringsManager.cantSignUp} $e ', status: false);
    }
  }

  Future<User> get getUser async => _auth.currentUser!;

  Future<FirebaseResponse> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        UserModel? currentUser =
            await UsersDB.getCurrentUser(userCredential.user!.uid);
        await HiveService().addItem('user', currentUser);
        if (currentUser!.userType == 'employer') {
          Get.offAllNamed(Routes.employerHome);
        } else if(currentUser.userType == 'jobSeeker'){
          Get.offAllNamed(Routes.jobSeekerHome);
        }
        print('Login done <<GOOD JOBS YARA >>');

        return FirebaseResponse(
          message: StringsManager.accountCreatedSuccessfully,
          status: true,
        );
      }

      return FirebaseResponse(
          message: StringsManager.somethingWrong, status: false);
    } on FirebaseAuthException catch (e) {
      return _controlFirebaseException(e);
    } catch (error) {
      return FirebaseResponse(
          message: '${StringsManager.somethingWrong} $error', status: false);
    }
  }

  singInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } on FirebaseAuthException catch (e) {
      // showSnackBar(context, e.message!); // Displaying the error message
    }
  }

  //ForgetPassword
  Future<FirebaseResponse> forgetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return FirebaseResponse(
          message: StringsManager.passwordResetDone, status: true);
    } on FirebaseAuthException catch (e) {
      return _controlFirebaseException(e);
    } catch (e) {
      //
    }
    return FirebaseResponse(
        message: StringsManager.somethingWrong, status: false);
  }

  static resetPassword(String emailAddress) async =>
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress);

  // EMAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      _auth.currentUser!.sendEmailVerification();
      // Email verification sent!
    } on FirebaseAuthException catch (e) {
// e.message!
    }
  }

  //Logout
  Future<void> signOut() async {
    await _auth.signOut();
  }

  void resendVerificationCode() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.sendEmailVerification();
      }
    } catch (e) {
      // Handle errors
    }
  }

  // DELETE ACCOUNT
  Future<void> deleteAccount(BuildContext context) async {
    try {
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      // Displaying the error message
      // if an error of requires-recent-login is thrown, make sure to log
      // in user again and then delete account.
    }
  }

  Future<void> setRememberMe(bool value) async {
    SecureStorage().writeSecureStorage(StringsManager.rememberMe, value);
  }

  Future<bool> getRememberMe() async {
    return false;
    // return await SecureStorage().readSecureStorage(StringsManager.rememberMe) ??
    //     false;
  }

  Future<bool> autoLogin() async {
    try {
      final userCredential = await _auth.signInAnonymously();
      return userCredential.user != null;
    } catch (e) {
      return false;
    }
  }

  String getCurrentUserId() {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      return auth.currentUser!.uid;
    }
    return '';
  }

  Future<bool> isUserLoggedIn() async {
    final user = _auth.currentUser;
    return user != null;
  }
}
