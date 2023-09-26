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
            hint: StringsManager.enterName.tr,
            label: StringsManager.name.tr,
            controller: controller.nameController,
            maxLines: 1,
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
            hint: StringsManager.enterEmail.tr,
            label: StringsManager.email.tr,
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
            label: StringsManager.password.tr,
            hint: StringsManager.enterPassword.tr,
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
                              Get.bottomSheet(
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: WidthManager.w15,vertical: HeightManager.h10),
                                  decoration: BoxDecoration(
                                      color: ColorsManager.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(
                                              RadiusManager.r30),
                                          topLeft: Radius.circular(
                                              RadiusManager.r30))),
                                  child: SingleChildScrollView(
                                    child: Column(
                                     // mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        //image
                                        Padding(
                                          padding:
                                              EdgeInsets.all(WidthManager.w20),
                                          child: Text(
                                            StringsManager.termsAndPrivacy,
                                            textAlign: TextAlign.center,
                                            style: getBoldTextStyle(
                                                fontSize: FontSizeManager.s18,
                                                color: ColorsManager.black),
                                          ),
                                        ),

                                        SvgPicture.asset(
                                          AssetsManager.acceptTerms,
                                          height: HeightManager.h150,
                                          width: WidthManager.w150,
                                        ),
                                        SizedBox(
                                          height: HeightManager.h20,
                                        ),
                                        RichText(
                                            text: TextSpan(
                                                text: welcome,
                                                style: getBoldTextStyle(
                                                    fontSize:
                                                        FontSizeManager.s18,
                                                    color: ColorsManager.black),
                                                children: [
                                              TextSpan(
                                                  text: jobHorizon,
                                                  style: getBoldTextStyle(
                                                      fontSize:
                                                          FontSizeManager.s16,
                                                      color: ColorsManager
                                                          .primary),
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () {})
                                            ])),

                                        SizedBox(height: HeightManager.h15,),
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
                                ),
                              );
                            },
                        )
                      ])),
                ],
              ),
            ],
          ),

          MainButton(
              width: double.infinity,
              height: HeightManager.h50,
              color: ColorsManager.primary,
              radius: RadiusManager.r10,
              onPressed: () {
                controller.performRegister(context);
              },
              child: Text(StringsManager.register.tr)),

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
