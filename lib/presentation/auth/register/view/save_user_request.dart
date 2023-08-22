import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduation_project/core/resources/assets_manager.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/fonts_manager.dart';
import 'package:graduation_project/core/resources/routes_manager.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/widget/main_button.dart';

import '../controller/register_controller.dart';

class SaveUserRequest extends StatelessWidget {

  SaveUserRequest({super.key});
  RegisterController controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: HeightManager.h100),
            child: Column(
              children: [
                Text(
                  StringsManager.askToSaveLogin,
                  style: getBoldTextStyle(
                      fontSize: FontSizeManager.s30,
                      color: ColorsManager.black),
                ),
                Padding(
                  padding: EdgeInsets.all(WidthManager.w10),
                  child: Text(
                    textAlign: TextAlign.center,
                    StringsManager.askToSaveLoginSub1 +
                        StringsManager.askToSaveLoginSub2,
                    style: getMediumTextStyle(
                        fontSize: FontSizeManager.s16,
                        color: ColorsManager.grey),
                  ),
                ),

                // SizedBox(height:HeightManager.h100 ,),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.end,
                //   children: [
                //     SvgPicture.asset(AssetsManager.logo,
                //         height: HeightManager.h35,
                //         width: WidthManager.w35,
                //         colorFilter: const ColorFilter.mode(
                //             ColorsManager.primary, BlendMode.srcIn)),
                //     SizedBox(
                //       width: WidthManager.w20,
                //     ),
                //     Text(StringsManager.appName,
                //       style: getBoldTextStyle(
                //           fontSize: FontSizeManager.s24,
                //           color: ColorsManager.primary),
                //     ),
                //   ],
                // ),

                // two button
                // one for save + second for not now
              ],
            ),
          ),
          Column(children: [
            MainButton(
                width: double.infinity,
                height: HeightManager.h50,
                color: ColorsManager.primary,
                horizontalMargin: WidthManager.w10,
                onPressed: () {
                  //go to home page and save user data in Hive

                  controller.goToHomePage();
                },
                child: Text(
                  StringsManager.save,
                  style: getMediumTextStyle(
                      fontSize: FontSizeManager.s18,
                      color: ColorsManager.white),
                )),
            MainButton(
                width: double.infinity,
                height: HeightManager.h50,
                color: ColorsManager.white,
                horizontalMargin: WidthManager.w10,

                onPressed: () {
                  controller.goToHomePageWithoutSave();
                },
                child: Text(
                  StringsManager.notNow,
                  style: getMediumTextStyle(
                      fontSize: FontSizeManager.s18,
                      color: ColorsManager.black),
                )),
          ]),
        ],
      ),
    );
  }
}
