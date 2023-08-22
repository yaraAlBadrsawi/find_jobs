import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/widget/main_button.dart';
import 'package:graduation_project/presentation/auth/verify/controller/verify_controller.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/fonts_manager.dart';

class VerifyEmailView extends GetView<VerifyController> {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: HeightManager.h100, horizontal: WidthManager.w10),
        child: Column(
          children: [
            SvgPicture.asset(
              AssetsManager.emailVerify,
              height: HeightManager.h200,
              width: WidthManager.w200,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: HeightManager.h20),
              child: Text(StringsManager.verifyYourEmail,
                  style: getBoldTextStyle(
                      fontSize: FontSizeManager.s20,
                      color: ColorsManager.black)),
            ),
            Text(
              StringsManager.verifyYourEmailSub,
              textAlign: TextAlign.center,
              style: getMediumTextStyle(
                  fontSize: FontSizeManager.s16, color: ColorsManager.grey),
            ),
            SizedBox(
              height: HeightManager.h10,
            ),
            Text(
              StringsManager.verifyYourEmailSub2,
              textAlign: TextAlign.center,
              style: getMediumTextStyle(
                  fontSize: FontSizeManager.s16, color: ColorsManager.grey),
            ),
            SizedBox(
              height: HeightManager.h20,
            ),
           GetBuilder<VerifyController>(builder: (controller){
            return MainButton(
                 width: double.infinity,
                 height: HeightManager.h60,
                 color: ColorsManager.primary,
                 onPressed: () {
                   controller.continues();

                 },
                 child: Text(StringsManager.continues,
                     style: getMediumTextStyle(
                         fontSize: FontSizeManager.s16,
                         color: ColorsManager.white)));

           }),
            SizedBox(height: HeightManager.h20,),
            GetBuilder<VerifyController>(
              builder: (controller) {
                return TextButton(
                  style: TextButton.styleFrom(foregroundColor: ColorsManager.primary),

                  onPressed: () {
          controller.resendEmail();
                  },
                  child: Text(
                    StringsManager.resend,
                    style: getMediumTextStyle(
                        fontSize: FontSizeManager.s16,
                        color: ColorsManager.primary),
                  ),
                );
              }
            ),
            SizedBox(height: HeightManager.h20,),
            GetBuilder<VerifyController>(
              builder: (controller) {
                return TextButton(
                  style: TextButton.styleFrom(foregroundColor: ColorsManager.primary),
                  onPressed: () {
                 controller.changeEmail(context);
                  },
                  child: Text(
                    StringsManager.changeEmail,
                    style: getMediumTextStyle(
                        fontSize: FontSizeManager.s16,
                        color: ColorsManager.primary),
                  ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
