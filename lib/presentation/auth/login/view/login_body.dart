import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

class LoginBody extends GetView<LoginController> {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          AppTextFields(
            label: StringsManager.email,
            controller: controller.emailController,
            hint: StringsManager.enterEmail,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => FieldValidator.validateEmail(value),
            prefixIcon: Icon(
              FontAwesomeIcons.solidEnvelope,
              size: IconSizeManager.s20,
              color: ColorsManager.primary,
            ),
          ),
          SizedBox(
            height: HeightManager.h20,
          ),
          AppPassFields(
            label: StringsManager.password,
            prefixIcon:const Icon(
             FontAwesomeIcons.key,
              color: ColorsManager.primary,
            ),
            controller: controller.passwordController,
            validator: (value) => FieldValidator.validatePassword(value),
          ),
          SizedBox(
            height: HeightManager.h10,
          ),
          MainButton(
              width: double.infinity,
              height: HeightManager.h50,
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
            height: HeightManager.h40,
          ),
          MainButton(
            color: ColorsManager.green,
            onPressed: () {
              Get.toNamed(Routes.registerView);
            },
            width: double.infinity,
            height: HeightManager.h50,
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
    );
  }
}
