import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/widget/main_button.dart';
import 'package:graduation_project/presentation/verification/controller/verification_controller.dart';
import 'package:graduation_project/presentation/verification/view/widget/code_verification.dart';

import '../../../config/constants.dart';
import '../../../core/resources/colors_mangaer.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/sizes_manager.dart';
import '../../../core/resources/strings_manager.dart';
import '../../../core/resources/styles_manager.dart';

class VerificationView extends GetView<VerificationController> {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            StringsManager.verificationCode,
            style: getMediumTextStyle(
              fontSize: FontSizeManager.s18,
              color: ColorsManager.black,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: ColorsManager.white,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: WidthManager.w20,
            vertical: HeightManager.h20,
          ),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                SizedBox(
                  height: HeightManager.h10,
                ),
                Text(
                  StringsManager.subTitleVerification,
                  style: getMediumTextStyle(
                    fontSize: FontSizeManager.s18,
                    color: ColorsManager.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: WidthManager.w24,
                    vertical: HeightManager.h4,
                  ),
                  child: Text(
                    StringsManager.verifyMessage,
                    style: getRegularTextStyle(
                      fontSize: FontSizeManager.s14,
                      color: ColorsManager.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: HeightManager.h30,
                ),
                Expanded(
                  child: Row(children: [
                    CodeVerification(
                      controller: controller.firstCodeTextController,
                      focusNode: controller.firstFocusNode,
                      previousFocusNode: controller.firstFocusNode,
                      onChanged: (String value) {
                        if (value.isNotEmpty) {
                          controller.secondFocusNode.requestFocus();
                        }
                      },
                      validator: (value) =>
                          controller.validator.validateCode(value),
                    ),
                    SizedBox(width: WidthManager.w10,),
                  ]),
                )
              ],
            ),
          ),
        ));
  }
}
