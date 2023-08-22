import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/resources/fonts_manager.dart';
import 'package:graduation_project/core/resources/routes_manager.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/presentation/auth/login/controller/login_controller.dart';
import '../../../../core/validator/validator.dart';
import '../../../../core/widget/main_button.dart';
import '../../../../core/widget/text_field.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';

import '../../widget/check_box.dart';

class LoginBody extends GetView<LoginController> {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: SizedBox(
        child: Column(
          children: [
            AppTextFields(
              controller: controller.emailController,
              hint: StringsManager.email,
              validator: (value) => FieldValidator.validateEmail(value),
            ),
            SizedBox(
              height: HeightManager.h20,
            ),
            AppPassFields(
              controller: controller.passwordController,
              validator: (value) => FieldValidator.validatePassword(value),
            ),
            SizedBox(
              height: HeightManager.h10,
            ),
            // Obx(() => LabeledCheckbox(
            //       label: StringsManager.rememberMe,
            //       onChanged: (newValue) {
            //         controller.checkRememberMer(newValue);
            //         controller.toggleRememberMe(newValue);
            //       },
            //       value: controller.checkedValue.value,
            //     ),),
            //
            SizedBox(
              height: HeightManager.h10,
            ),
            MainButton(
                width: double.infinity,
                height: HeightManager.h40,
                color: ColorsManager.primary,
                onPressed: () {
                  if (controller.formKey.currentState!.validate()) {
                    controller.performLogin(context);
                    //go to Home page
                  }
                },
                child: Text(
                  StringsManager.login.tr,
                  style: TextStyle(fontSize: FontSizeManager.s16),
                )),
            SizedBox(
              height: HeightManager.h45,
            ),
            MainButton(
              color: ColorsManager.green,
              onPressed: () {
                Get.toNamed(Routes.registerView);
              },
              width: double.infinity,
              height: HeightManager.h40,
              child: Text(
                StringsManager.signUp.tr,
                style: TextStyle(fontSize: FontSizeManager.s16),
              ),
            ),
            SizedBox(
              height: HeightManager.h20,
            ),
            InkWell(
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  StringsManager.forgetPassword,
                  // style: AppStyles.links(),
                ),
              ),
              onTap: () {
                Get.toNamed(Routes.forgetPasswordView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
