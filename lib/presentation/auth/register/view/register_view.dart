import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/presentation/auth/register/view/register_body.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import '../../widget/auth_layout.dart';
import '../controller/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      header: StringsManager.signUp,
      dis: StringsManager.registerDes,
      subtitle: StringsManager.registerSub,
      fields: RegisterBody(),
    );
  }
}
