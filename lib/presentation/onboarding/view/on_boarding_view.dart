import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:graduation_project/presentation/onboarding/view/widget/circle_button.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import '../../../core/widget/main_button.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/fonts_manager.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';

import '../controller/on_boarding_controller.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: WidthManager.w20,
            vertical: HeightManager.h10,
          ),
          child: GetBuilder<OnBoardingController>(builder: (controller) {
            return Column(
              children: [
                Visibility(
                  visible: controller.isNotLastedPage(),
                  maintainSize: true,
                  maintainState: true,
                  maintainAnimation: true,
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: MainButton(
                      width: WidthManager.w70,
                      height: HeightManager.h40,
                      color: ColorsManager.transparent,
                      onPressed: () {
                        controller.skipPage();
                      },
                      child: Text(StringsManager.skip,
                          style: TextStyle(
                            fontSize: FontSizeManager.s16,
                            fontFamily: FontFamilyManager.fontFamily,
                            fontWeight: FontWeightManager.regular,
                            color: ColorsManager.textColor,
                            decoration: TextDecoration.none,
                          )),
                    ),
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: controller.pageController,
                    children: [
                      ...controller.pageViewItems,
                    ],
                    onPageChanged: (index) {
                      controller.setCurrentPage(index);
                    },
                  ),
                ),
                Visibility(
                  visible: controller.isNotLastedPage(),
                  replacement: MainButton(
                    // child =>
                    width: double.infinity,
                    height: HeightManager.h40,
                    color: ColorsManager.primary,
                    // Color =
                    // onPressed =>
                    onPressed: () {
                      controller.getStart();
                    },
                    // child =>
                    child: Text(
                      StringsManager.getStartButton,
                      style: getRegularTextStyle(
                        fontSize: FontSizeManager.s14,
                        color: ColorsManager.white,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: controller.showBackButton(),
                        child: CircleButton(
                          onPressed: () {
                            controller.previousPage();
                          },
                          iconData: Icons.arrow_back_outlined,
                        ),
                      ),
                      CircleButton(
                        onPressed: () {
                          print('controller.nextPage()');
                          controller.nextPage();
                        },
                        iconData: Icons.arrow_forward_outlined,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
