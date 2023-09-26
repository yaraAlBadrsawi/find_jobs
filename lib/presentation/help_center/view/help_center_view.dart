import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/presentation/help_center/view/widget/custom_contact_us_row.dart';
import 'package:graduation_project/presentation/help_center/view/widget/custom_help_column.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/colors_mangaer.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/sizes_manager.dart';
import '../../../core/resources/strings_manager.dart';
import '../../../core/resources/styles_manager.dart';

class HelpCenterView extends StatelessWidget {
  const HelpCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    StringsManager.helpCenter,
                    style: getBoldTextStyle(
                      fontSize: FontSizeManager.s22,
                      color: ColorsManager.primary,
                    ),
                  ),
                  SizedBox(
                    width: WidthManager.w20,
                  ),
                ],
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(24, 40, 24, 24),
                  alignment: Alignment.centerLeft,
                  child: Text('FAQ',
                      style: getBoldTextStyle(
                          fontSize: FontSizeManager.s18, color: Colors.black))),
              CustomHelpColumn(
                text: StringsManager.helpCenter,
                paddingBottom: 13,
              ),
              CustomHelpColumn(
                text: StringsManager.helpCenter,
                paddingBottom: 13,
              ),
              CustomHelpColumn(
                text: StringsManager.helpCenter,
                paddingBottom: 13,
              ),
              CustomHelpColumn(
                text: StringsManager.helpCenter,
                paddingBottom: 13,
              ),

              Container(
                margin: const EdgeInsets.all(24),
                alignment: Alignment.centerLeft,
                child: Text(
                  StringsManager.contact,
                  style: getRegularTextStyle(
                      fontSize: FontSizeManager.s18,
                      color: ColorsManager.black),
                ),
              ),
              CustomContactUsRow(
                iconPath: AssetsManager.contactUs,
                title: 'chat us now',
                body: 'chat her',
                onTap: () => print('tap'),
              ),
              CustomContactUsRow(
                iconPath: AssetsManager.sendEmail,
                title: 'chat us now',
                body: 'chat her',
                onTap: () => print('tap'),
              ),
              CustomContactUsRow(
                iconPath: AssetsManager.callUs,
                title: 'chat us now',
                body: 'chat her',
                onTap: () => print('tap'),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  '© Copyright 2023 - J.H',
                  style: getRegularTextStyle(
                      fontSize: FontSizeManager.s14,
                      color: ColorsManager.black),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
