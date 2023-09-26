import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/core/network/auth/user_db.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import '../../../config/constants.dart';
import '../../model/base_model.dart';
import '../../model/user.dart';
import '../../resources/colors_mangaer.dart';
import '../../resources/routes_manager.dart';
import '../../storage/local/app_settings_shared_preferences.dart';
import '../../storage/local/hive_data_store/hive_data_store.dart';


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
  final FirebaseAuth auth = FirebaseAuth.instance;

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


        bool isSavedToDB = await InsertUsers.addAllUserInDB(newUser);
        if (isSavedToDB) {
          /// save data in SecureStorage
          Authenticate()._saveUserDataInSecureStorage(user, password);
        }

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

  Future<User> get getUser async => auth.currentUser!;

  void _saveUserDataInSecureStorage(UserModel user, String password) {
    // save email in secure storage
    SecureStorage().writeSecureStorage(StringsManager.email, user.email);
    // save password in secure storage
    SecureStorage().writeSecureStorage(StringsManager.password, password);
    // save phoneNumber in secure storage
    SecureStorage().writeSecureStorage(StringsManager.phone, user.phoneNumber);
    // save userType in secure storage
    SecureStorage().writeSecureStorage(StringsManager.userType, user.userType);
    // save userId in secure storage
    SecureStorage().writeSecureStorage(StringsManager.userId, user.userID);
  }

 Future<User> get getUser async => _auth.currentUser!;

  Future<FirebaseResponse> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // if (userCredential.user != null) {
      //   UserModel? currentUser =
      //       await UsersDB.getCurrentUser(userCredential.user!.uid);
      //   await HiveService().addItem('user', currentUser);
      //   HiveService().isUserLogged('isLogged', true);
      //   print('Hive => ${HiveService().getLoginStatus('isLogged')}') ;
      //
      //   if (currentUser!.userType == UserType.employer) {
      //     Get.offAllNamed(Routes.employerInfoView);
      //   } else if (currentUser.userType == UserType.jobSeeker) {
      //     Get.offAllNamed(Routes.jobSeekerBottomBarView);
      //   }
      //   print('Login done <<GOOD JOBS YARA >>');
      //
      //   return FirebaseResponse(
      //     message: StringsManager.accountCreatedSuccessfully,
      //     status: true,
      //   );
      // }

      if (userCredential.user != null) {
        User user = await Authenticate().getUser;

       SecureStorage().writeSecureStorage(StringsManager.userId, userCredential.user!.uid);
        print('Login done <<GOOD JOBS YARA >>');


        UserModel userModel = await UsersDB.getCurrentUser(user.uid);
        HiveService().addItem(Constants.user, userModel);
        return FirebaseResponse(
            message: StringsManager.loginDone, status: true);
      } else {
        return FirebaseResponse(
            message: StringsManager.loginDone, status: false);
      }
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
      print('error => $e');
    }
  }

  //ForgetPassword
  Future<FirebaseResponse> forgetPassword({required String email}) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
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

      auth.currentUser!.sendEmailVerification();

      _auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
// e.message!
    }
  }

  //Logout
  Future<void> signOut() async {
    await auth.signOut();
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      }
      else {
        print('User is signed in!');
      }
    });
  }

  void resendVerificationCode() async {
    try {
      User? user = auth.currentUser;
      if (user != null) {
        await user.sendEmailVerification();
      }
    } catch (e) {
      // Handle errors
    }
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
      await auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      // Displaying the error message
      // if an error of requires-recent-login is thrown, make sure to log
      // in user again and then delete account.
    }
  }

  Future<bool> autoLogin() async {
    try {
      final userCredential = await auth.signInAnonymously();
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
    final user = auth.currentUser;
    return user != null;
  }


// ...

  Future<void> changePassword(String newPassword) async {
    User? user = FirebaseAuth.instance.currentUser;

    try {
      await user!.updatePassword(newPassword);
      print('Password changed successfully.');
    } catch (e) {
      print('Error changing password: $e');
    }
  }



  bool checkUserLogin() {
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        // what you want to happen in sing out

      }
      else {
        print('User is signed in!');
      }
    });
    return false;
  }
}
