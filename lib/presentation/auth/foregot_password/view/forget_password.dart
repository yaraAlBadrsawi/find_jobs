import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/presentation/auth/foregot_password/controller/forget_password_controller.dart';

import '../../../../core/resources/strings_manager.dart';
import '../../widget/auth_layout.dart';
class ForgetPasswordView extends GetView<ForgetPasswordController> {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthLayout(
      header: StringsManager.forgetPassword,
      dis: StringsManager.registerDes,
      subtitle: StringsManager.registerSub,
      fields: ForgetPassword(),
    );
  }
}

class ForgetPassword extends GetView<ForgetPasswordController>{
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(child: Column(children: [
      // image

    ],),);
  }
}

