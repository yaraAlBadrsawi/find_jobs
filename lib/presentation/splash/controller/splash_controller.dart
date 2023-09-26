import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:graduation_project/config/constants.dart';
import 'package:graduation_project/core/resources/routes_manager.dart';

import '../../../core/model/user.dart';
import '../../../core/network/auth/auth.dart';
import '../../../core/network/auth/user_db.dart';
import '../../../core/storage/local/hive_data_store/hive_data_store.dart';

class SplashController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    super.onInit();
    checkUserLogin();

  animationInitilization();

  }

  checkUserLogin() async {
    //final userLoggedIn = await Authenticate().checkUserLogin();

    Authenticate().auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('user is currently sign out ');
        // what you want to happen in sing out
      } else {
        print('User is signed in!');
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


  animationInitilization() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: Constants.splashDuration));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut)
            .obs
            .value;
    animation.addListener(() => update());
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Animation is complete, navigate to onboarding screen
        Get.offNamed(Routes.onBoarding); // Replace with your onboarding route
      }
    });
    animationController.forward();

    update();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

}