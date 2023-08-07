import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';

import '../../../../core/model/base_model.dart';
import '../../../../core/network/auth/auth.dart';
import '../../../../core/widget/loading.dart';

class LoginController extends GetxController {
  var formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  performLogin(context) async {
    LoadingDialog.show();
    if (formKey.currentState!.validate()) {
      FirebaseResponse fbResponse =
      await Authenticate.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      // TODO: show snack bar to tell user account create done
      Get.snackbar(fbResponse.message, '${fbResponse.status}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: ColorsManager.primary);


      LoadingDialog.hide();
    // if(current==1){
    //   Get.offNamed(Routes.employerHome);
    //
    // }else {
    //   Get.offNamed(Routes.jobSeekerHome);
    // }
    }


  }


}