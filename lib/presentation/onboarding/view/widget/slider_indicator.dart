import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/constants.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import '../../controller/on_boarding_controller.dart';


class SliderIndicator extends StatelessWidget {
  const SliderIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
      builder: (controller) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: WidthManager.w65),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(RadiusManager.r12),
            color: ColorsManager.grey,
          ),
          width: double.infinity,
          height: HeightManager.h4,
          child: Row(
            children: [
              ...List.generate(
                Constants.sliderItems,
                    (index) => Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(
                      seconds: Constants.onBoardingDurationTime,
                    ),
                    curve: Curves.fastLinearToSlowEaseIn,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        RadiusManager.r12,
                      ),
                      color: controller.currentPage == index
                          ? ColorsManager.primary
                          : ColorsManager.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
