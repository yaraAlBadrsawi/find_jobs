import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/core/storage/secure_storage/secure_storage.dart';

import '../../../../core/model/base_model.dart';
import '../../../../core/network/auth/auth.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/widget/loading.dart';

class LoginController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var checkedValue = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    checkUserLogin();
  }

  checkUserLogin() async {
    final userLoggedIn = await Authenticate().isUserLoggedIn();
    final rememberMe = await Authenticate().getRememberMe();

    if (userLoggedIn || (rememberMe && await Authenticate().autoLogin())) {
      // User is logged in, navigate to home screen
      if (await SecureStorage().readSecureStorage(StringsManager.userType) ==
          1) {
        Get.offNamed(Routes.employerHome);
      } else {
        Get.offNamed(Routes.jobSeekerHome);
      }
    }
  }

  checkRememberMer(newValue) {
    checkedValue.value = newValue;
    update();
  }

  void toggleRememberMe(bool value) {
    Authenticate().setRememberMe(value);
    update();
  }

  performLogin(context) async {
    LoadingDialog.show();
    if (formKey.currentState!.validate()) {
      FirebaseResponse fbResponse =
          await Authenticate.signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);

      LoadingDialog.hide();
      Get.snackbar(StringsManager.loginDone, StringsManager.empty,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: ColorsManager.primary);

      if (fbResponse.status) {
        if (await SecureStorage().readSecureStorage(StringsManager.userType) ==
            1) {
          Get.offNamed(Routes.employerHome);
        } else {
          Get.offNamed(Routes.jobSeekerHome);
        }
      }
    }
  }
}
