import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduation_project/presentation/auth/widget/auth_layout.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';

import '../controller/login_controller.dart';
import 'login_body.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      header: StringsManager.login,
      dis: StringsManager.loginDes,
      subtitle: StringsManager.loginSub,
      fields: Container(
          decoration: BoxDecoration(
              color: ColorsManager.white,
              borderRadius: BorderRadius.circular(RadiusManager.r30)),
          padding: EdgeInsets.all(WidthManager.w20),
          child: LoginBody()
      ),
    );
  }
}
