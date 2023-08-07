import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/resources/fonts_manager.dart';
import 'package:graduation_project/core/resources/routes_manager.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/presentation/auth/login/controller/login_controller.dart';

import '../../../../core/widget/main_button.dart';
import '../../../../core/widget/text_field.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';

class LoginBody extends GetView<LoginController> {
  LoginBody({super.key});

  final GlobalKey<FormState> _key = GlobalKey();

  // bool isSignIn = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: SizedBox(
        child: Column(
          children: [
            AppTextFields(
              hint: StringsManager.name,
              validator: (name) {
                controller.formKey.currentState!.validate();
              },
            ),
            SizedBox(
              height: HeightManager.h20,
            ),
            AppPassFields(
              validator: (pass) {
                controller.formKey.currentState!.validate();
              },
            ),
            SizedBox(
              height: HeightManager.h20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  StringsManager.forgetPassword,
                  // style: AppStyles.links(),
                )
              ],
            ),
            SizedBox(
              height: HeightManager.h10,
            ),
            MainButton(
                child: Text(
                  StringsManager.login,
                  style: TextStyle(fontSize: FontSizeManager.s16),
                ),
                width: double.infinity,
                height: HeightManager.h40,
                color: ColorsManager.primary,
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    //go to Home page
                  }
                }),
            SizedBox(
              height: HeightManager.h45,
            ),
            MainButton(
              child: Text(
                StringsManager.signUp,
                style: TextStyle(fontSize: FontSizeManager.s16),
              ),
              color: ColorsManager.green,
              onPressed: () {
                Get.toNamed(Routes.registerView);
              },
              width: double.infinity,
              height: HeightManager.h40,
            ),
            SizedBox(
              height: HeightManager.h20,
            ),
          ],
        ),
      ),
    );
  }
}
