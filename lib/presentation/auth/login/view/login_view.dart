import 'package:flutter/material.dart';
import 'package:graduation_project/presentation/auth/view/widget/auth_layout.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';

import 'login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      header: StringsManager.login,
      dis: 'Hi, Iam Marim Mohamed.... Nice to meet u!', //TODO : ADD Text to ManagerStrings
      fields: Container(
          decoration: BoxDecoration(
              color: ColorsManager.white, borderRadius: BorderRadius.circular(30)),
          padding:  EdgeInsets.all(WidthManager.w20),
          child: LoginBody()),
    );
  }
}
