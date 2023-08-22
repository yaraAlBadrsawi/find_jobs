import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/resources/routes_manager.dart';
import 'package:graduation_project/core/widget/main_button.dart';
import 'package:graduation_project/core/resources/fonts_manager.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/presentation/auth/widget/popup.dart';
import '../../../../config/constants.dart';
import '../../../../core/validator/validator.dart';
import '../../../../core/widget/dialog.dart';
import '../../../../core/widget/text_field.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';

import '../../../core/resources/assets_manager.dart';
import '../register/controller/register_controller.dart';

class Details extends GetView<RegisterController> {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          AppTextFields(
            hint: StringsManager.name.tr,
            controller: controller.nameController,
            prefixIcon: Icon(
            FontAwesomeIcons.solidUser,
              color: ColorsManager.primary,
              size: IconSizeManager.s20,
            ),
            validator: (value) {
              return FieldValidator.validateName(value);
            },
          ),
          SizedBox(
            height: HeightManager.h20,
          ),
          AppTextFields(
            hint: StringsManager.email.tr,
            controller: controller.emailController,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icon(
            FontAwesomeIcons.solidEnvelope,
              size: IconSizeManager.s20,
              color: ColorsManager.primary,
            ),
            validator: (value) {
              return FieldValidator.validateEmail(value);
            },
          ),
          SizedBox(
            height: HeightManager.h20,
          ),
          AppTextFields(
            hint: StringsManager.password.tr,
            controller: controller.passwordController,
            prefixIcon: Icon(
              FontAwesomeIcons.key,
              color: ColorsManager.primary,
              size: IconSizeManager.s20,
            ),
            obscure: true,
            validator: (value) {
              return FieldValidator.validatePassword(value);
            },
          ),
          SizedBox(
            height: HeightManager.h20,
          ),
          //phone Number :

          // appear in all three user :

          //terms&conditions
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Checkbox(
                  value: controller.isAgreementPolicy.value,
                  checkColor: ColorsManager.white,
                  activeColor: ColorsManager.primary,
                  onChanged: (value) {
                    controller.toggleCheck(controller.isAgreementPolicy.value);
                  })),
              SizedBox(
                height: HeightManager.h10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          text: StringsManager.iAgree,
                          style: getRegularTextStyle(
                              fontSize: FontSizeManager.s14,
                              color: ColorsManager.black),
                          children: [
                        TextSpan(
                          text: StringsManager.termsAndPrivacy,
                          style: getBoldTextStyle(
                              fontSize: FontSizeManager.s14,
                              color: ColorsManager.primary),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              DialogUtil.showCustomDialog(
                                  title: StringsManager.termsAndPrivacy,
                                  content: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        //image
                                        SvgPicture.asset(
                                            AssetsManager.googleIcon,
                                            height: HeightManager.h100,
                                            width: WidthManager.w100,
                                            colorFilter: const ColorFilter.mode(
                                                ColorsManager.primary,
                                                BlendMode.srcIn)),
                                        SizedBox(
                                          height: HeightManager.h20,
                                        ),
                                        Text(
                                          privacyPolicyIntro,
                                          style: getMediumTextStyle(
                                              fontSize: FontSizeManager.s16,
                                              color: ColorsManager.black),
                                        ),
                                        Text(
                                          privacyPolicy,
                                          style: getMediumTextStyle(
                                              fontSize: FontSizeManager.s14,
                                              color: ColorsManager.black),
                                        )
                                        // text
                                      ],
                                    ),
                                  ),
                                  actionText: StringsManager.ok);
                            },
                        )
                      ])),
                ],
              ),
            ],
          ),

          Obx(()
            => MainButton(
                width: double.infinity,
                height: HeightManager.h50,
                color: ColorsManager.primary,
                radius: RadiusManager.r10,
                onPressed: () async {
                  await controller.performRegister(context);
                },
                child: controller.registering.value
                    ? const CircularProgressIndicator(color: ColorsManager.white,)
                    : Text(StringsManager.register.tr)),
          ),
          SizedBox(
            height: HeightManager.h20,
          ),
          RichText(
              text: TextSpan(
                  text: StringsManager.alreadyHaveAccount,
                  style: getRegularTextStyle(
                      fontSize: FontSizeManager.s14,
                      color: ColorsManager.black),
                  children: [
                TextSpan(
                  text: StringsManager.signIn,
                  style: getBoldTextStyle(
                      fontSize: FontSizeManager.s14,
                      color: ColorsManager.primary),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.toNamed(Routes.loginView);
                    },
                )
              ])),
        ],
      ),
    );
  }
}
