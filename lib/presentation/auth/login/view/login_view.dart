import 'package:flutter/material.dart';
import 'package:graduation_project/presentation/auth/view/widget/auth_layout.dart';
import 'package:graduation_project/presentation/resource/colors_mangaer.dart';
import 'package:graduation_project/presentation/resource/strings_manager.dart';

import '../../view/widget/login_body.dart';

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
          padding: const EdgeInsets.all(20),
          child: LoginBody()),
    );
  }
}
