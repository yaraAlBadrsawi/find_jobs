import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/config/constants.dart';
import 'package:graduation_project/core/network/auth/auth.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/core/storage/local/hive_data_store/hive_data_store.dart';
import 'package:graduation_project/core/widget/main_button.dart';
import 'package:graduation_project/presentation/setting/view/widget/custom_settings_row.dart';
import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/colors_mangaer.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/routes_manager.dart';
import '../../../core/resources/styles_manager.dart';
import '../../../core/widget/text_field.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: WidthManager.w20, vertical: HeightManager.h60),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: ColorsManager.black,
                  onPressed: () {
                    Get.back();
                  },
                ),
                Text(
                  StringsManager.setting,
                  style: getBoldTextStyle(
                    fontSize: FontSizeManager.s22,
                    color: ColorsManager.primary,
                  ),
                ),
                SizedBox(
                  width: WidthManager.w50,
                ),
              ],
            ),
            SizedBox(
              height: HeightManager.h30,
            ),
            SvgPicture.asset(
              AssetsManager.setting_,
              width: WidthManager.w220,
              height: HeightManager.h220,
            ),
            SizedBox(
              height: HeightManager.h30,
            ),
            CustomSettingsRow(
              onTap: () {
                Get.toNamed(Routes.editProfile);
                // Get.toNamed(HiveService().getItem(Constants.user).userType=='employer'?Routes.employerProfile:Routes.jobSeekerProfile);
              },
              title: StringsManager.myAccount, icon: FontAwesomeIcons.user,

              // StringsManager.changePassword,
            ),
            SizedBox(
              height: HeightManager.h30,
            ),
            CustomSettingsRow(
              onTap: () {
                Get.bottomSheet(
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: WidthManager.w15,
                        vertical: HeightManager.h10),
                    decoration: BoxDecoration(
                        color: ColorsManager.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(RadiusManager.r30),
                            topLeft: Radius.circular(RadiusManager.r30))),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //image
                          Padding(
                            padding: EdgeInsets.all(WidthManager.w20),
                            child: Text(
                              StringsManager.changePassword,
                              textAlign: TextAlign.center,
                              style: getBoldTextStyle(
                                  fontSize: FontSizeManager.s18,
                                  color: ColorsManager.black),
                            ),
                          ),

                          SvgPicture.asset(
                            AssetsManager.resetPassword,
                            height: HeightManager.h100,
                            width: WidthManager.w100,
                          ),
                          SizedBox(
                            height: HeightManager.h10,
                          ),

                          AppTextFields(
                            hint: 'write current password',
                          ),
                          SizedBox(
                            height: HeightManager.h10,
                          ),

                          AppTextFields(
                            hint: 'write new password',
                          ),
                          SizedBox(
                            height: HeightManager.h10,
                          ),
                          MainButton(
                              child: Text('change Password'),
                              height: HeightManager.h60,
                              color: ColorsManager.primary,
                              onPressed: () {})
                        ],
                      ),
                    ),
                  ),
                );
              },
              title: StringsManager.changePassword, icon: Icons.lock_open,

              // StringsManager.changePassword,
            ),
            SizedBox(
              height: HeightManager.h30,
            ),
            CustomSettingsRow(
              onTap: () {
                Get.toNamed(Routes.helpCenter);
              },
              title: StringsManager.helpCenter, icon: FontAwesomeIcons.question,

              // StringsManager.changePassword,
            ),
            SizedBox(
              height: HeightManager.h30,
            ),
            CustomSettingsRow(
              onTap: () {
                Authenticate().auth.signOut()
                    ;
                Get.toNamed(StringsManager.login);
              },
              title: StringsManager.logout,
              icon: FontAwesomeIcons.arrowRightFromBracket,

              // StringsManager.changePassword,
            ),
          ],
        ),
      ),
    );
  }
}
