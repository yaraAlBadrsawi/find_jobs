import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/model/user.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/core/storage/secure_storage/secure_storage.dart';

import '../../../../core/model/base_model.dart';
import '../../../../core/network/auth/auth.dart';
import '../../../../core/network/auth/user_operation.dart';
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
//getUser(key: StringsManager.user)
  //  checkUserLogin();
    getData();
  }

  getData() async {
    UserModel user = await HiveService().getItem(StringsManager.user);
    print('HIVE DATA BASE => ${user.name}');
  }

  checkUserLogin() async {
    final userLoggedIn = await Authenticate().isUserLoggedIn();

    print('current user is => $userLoggedIn');
    print('user type is => ......');
    User user = await Authenticate().getUser;
    // UserModel? userModel=  await UsersDB.getCurrentUser(user.uid);
    // if(userModel !=null ){
    //   print('userModel =>> $userModel');
    // print('user type  =>> ${userModel.userType}');
    // if ( userModel.userType == UserType.employer) {
    Get.offNamed(Routes.jobSeekerHome);

    // } else {
    //   Get.offNamed(Routes.employerBottomBarView);
    // Get.offNamed(Routes.jobSeekerHome);
  }


  performLogin(context) async {
    LoadingDialog.show();
    if (formKey.currentState!.validate()) {
      FirebaseResponse fbResponse = await Authenticate()
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      LoadingDialog.hide();

      if (fbResponse.status) {
        Get.snackbar(StringsManager.loginDone, StringsManager.empty,
            colorText: ColorsManager.white,
            backgroundColor: ColorsManager.primary.withOpacity(0.5));
      } else {
        Get.snackbar(fbResponse.message, StringsManager.empty,
            
            colorText: ColorsManager.white,
            backgroundColor: ColorsManager.primary.withOpacity(0.5));
      }
    }
  }
}
