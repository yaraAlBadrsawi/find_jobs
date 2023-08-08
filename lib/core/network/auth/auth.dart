import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:graduation_project/core/network/auth/user_operation.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import '../../model/base_model.dart';
import '../../model/user.dart';
import '../../resources/colors_mangaer.dart';
import '../../storage/local/app_settings_shared_preferences.dart';
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
          phoneNumber: user.phoneNumber,
          userType: user.userType,
        );

        bool isSavedToDB = await InsertUsers.addAllUserInDB(newUser);
        if (isSavedToDB) {
          /// save data in SecureStorage
          Authenticate()._saveUserDataInSecureStorage(user, password);
        }
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

  static Future<FirebaseResponse> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
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
  Future<void> sendEmailVerification(BuildContext context) async {
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
    return await SecureStorage().readSecureStorage(StringsManager.rememberMe) ??
        false;
  }

  Future<bool> autoLogin() async {
    try {
      final userCredential = await _auth.signInAnonymously();
      return userCredential.user != null;
    } catch (e) {
      return false;
    }
  }

  Future<bool> isUserLoggedIn() async {
    final user = _auth.currentUser;
    return user != null;
  }
}
