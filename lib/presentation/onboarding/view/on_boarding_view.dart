import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:graduation_project/presentation/onboarding/view/widget/circle_button.dart';
import 'package:graduation_project/presentation/resource/styles_manager.dart';
import '../../../core/widget/main_button.dart';
import '../../resource/colors_mangaer.dart';
import '../../resource/fonts_manager.dart';
import '../../resource/sizes_manager.dart';
import '../../resource/strings_manager.dart';
import '../view_model/on_boarding_controller.dart';

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
                      Text(StringsManager.skip,
                          style: TextStyle(
                            fontSize: FontSizeManager.s16,
                            fontFamily: FontFamilyManager.fontFamily,
                            fontWeight: FontWeightManager.regular,
                            color: ColorsManager.textColor,
                            decoration: TextDecoration.none,
                          )),
                      ColorsManager.transparent,
                      () {
                        controller.skipPage();
                      },
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
                    Text(
                      StringsManager.getStartButton,
                      style: getRegularTextStyle(
                        fontSize: FontSizeManager.s14,
                        color: ColorsManager.white,
                      ),
                    ),
                    ColorsManager.primary,
                    padding: EdgeInsets.symmetric(
                        horizontal: WidthManager.w100,
                        vertical: HeightManager.h20),
                    () {
                      controller.getStart();
                    },
                    minWidth: WidthManager.w15,
                    height: HeightManager.h40,
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
