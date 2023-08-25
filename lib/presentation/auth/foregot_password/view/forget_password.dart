import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/resources/assets_manager.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/presentation/auth/foregot_password/controller/forget_password_controller.dart';

import '../../../../core/resources/strings_manager.dart';
import '../../widget/auth_layout.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Padding(
      padding:  EdgeInsets.symmetric(vertical: HeightManager.h60),
      child: Column(children: [


        Image.asset(AssetsManager.forgetPassword),

      ]),
    ));
  }
}

class ForgetPassword extends GetView<ForgetPasswordController> {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          // image
        ],
      ),
    );
  }
}
