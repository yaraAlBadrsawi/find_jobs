import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/network/auth/auth.dart';
import 'package:graduation_project/core/resources/routes_manager.dart';

import '../../../../core/resources/colors_mangaer.dart';
import '../../../../core/resources/strings_manager.dart';

class VerifyController extends GetxController {
  var isEmailVerified = false;
  Timer? timer;
  late User currentUser;
  bool verificationMessageShown = false;
 late var arguments ;
  // Extract the user and password from the arguments
  late dynamic user;
  late String password;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      arguments = Get.arguments;
      user = arguments[0];
      password = arguments[1];
    }
    currentUser = FirebaseAuth.instance.currentUser!;
    if (!isEmailVerified) {
      Authenticate().sendEmailVerification();
      Timer.periodic(const Duration(seconds: 3), (timer) {
        checkEmailVerified();
      });
    }
  }

  void resendEmail() {
    Authenticate().resendVerificationCode();
    update();
  }

  Future checkEmailVerified() async {
    await currentUser.reload();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    timer?.cancel();
    update();
    if (isEmailVerified && !verificationMessageShown) {
      print('isEmailVerified => $isEmailVerified');
      verificationMessageShown = true; // Set the flag to true
      Get.snackbar(StringsManager.verifyDone, '',
          colorText: ColorsManager.white,
          backgroundColor: ColorsManager.primary.withOpacity(0.5));
      timer?.cancel();

      Get.toNamed(Routes.askToSave, arguments: [user,password]);
    }
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  void continues() {
    currentUser.reload();
    if (!FirebaseAuth.instance.currentUser!.emailVerified) {
      print(
          'emailVerified=> ${FirebaseAuth.instance.currentUser!.emailVerified}');
      Get.snackbar(StringsManager.checkEmail, '',
          colorText: ColorsManager.white,
          backgroundColor: ColorsManager.primary.withOpacity(0.5));
    } else {
      Get.toNamed(Routes.askToSave, arguments: {user,password});
    }

    update();
  }

  void changeEmail(context) {
    Get.back();
    Authenticate().deleteAccount(context);
    // delete user from fireStore too
  }
}
