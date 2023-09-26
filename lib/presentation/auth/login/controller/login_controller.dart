import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/config/constants.dart';
import 'package:graduation_project/core/model/user.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import '../../../../core/model/base_model.dart';
import '../../../../core/network/auth/auth.dart';
import '../../../../core/network/auth/user_db.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/storage/local/hive_data_store/hive_data_store.dart';
import '../../../../core/widget/loading.dart';

class LoginController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var checkedValue = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
// getUser(key: StringsManager.user)
    checkUserLogin();
    getData();
  }

  getData() async {
    UserModel? user = await HiveService().getItem(Constants.user);
    if (user != null) {
      print('HIVE DATA BASE => ${user}');
    }
  }

  checkUserLogin() async {
    //final userLoggedIn = await Authenticate().checkUserLogin();

    Authenticate().auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('user is currently sign out ');
        // what you want to happen in sing out
      } else {
        print('User is signed in!');
        print('current user is => ${FirebaseAuth.instance.currentUser!.email}');
        goToPage();
      }
    });
  }

  void goToPage() async {
    User user = await Authenticate().getUser;
    UserModel? userModel = await UsersDB.getCurrentUser(user.uid);
    if (userModel != null) {
      if (userModel.userType == UserType.employer.name) {
        // if user not complete his data go to complete it if complete , go to bottom bar

        HiveService().addItem(Constants.user, userModel);
        Get.offNamed(Routes.employerBottomBarView);
        //   Get.offNamed(Routes.employerBottomBarView);
      } else if (userModel.userType == UserType.jobSeeker.name) {
        // go to bottom bar
        // but if user not complete his interest then should go to it first
        Get.offNamed(Routes.jobSeekerBottomBarView);
      }
    }
  }

  performLogin(context) async {
    LoadingDialog.show();
    if (formKey.currentState!.validate()) {
      FirebaseResponse fbResponse = await Authenticate()
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      if (fbResponse.status) {
        User user = await Authenticate().getUser;
        UserModel? userModel = await UsersDB.getCurrentUser(user.uid);

        Get.snackbar(StringsManager.loginDone, StringsManager.empty,
            colorText: ColorsManager.white,
            backgroundColor: ColorsManager.primary.withOpacity(0.5));
        LoadingDialog.hide();
        goToPage();
      } else {
        LoadingDialog.hide();
        Get.snackbar(fbResponse.message, StringsManager.empty,
            colorText: ColorsManager.white,
            backgroundColor: ColorsManager.primary.withOpacity(0.5));
      }
    }
  }
}
