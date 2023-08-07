import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:graduation_project/config/firebase_constants.dart';
import 'package:graduation_project/core/network/auth/user_operation.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import '../../model/base_model.dart';
import '../../model/user.dart';
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
  static Future<FirebaseResponse> signUpWithEmailAndPassword(
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
        print('new User is email  => ${newUser.email}');
        InsertUsers.addAllUserInDB(newUser);

        return FirebaseResponse(
          message:
              'Account created successfully, check your email & verify account',
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
      StringsManager.cantSignUp;
      return FirebaseResponse(message: 'Something went wrong', status: false);
    }
  }



  Future<User> get getUser async => _auth.currentUser!;

  static signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (error) {
      Get.snackbar('auth.signInErrorTitle'.tr, 'auth.signInError'.tr,
          snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 7));
    }
  }




  forgetPassword() {}

  static resetPassword(String emailAddress) async =>
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress);
}
