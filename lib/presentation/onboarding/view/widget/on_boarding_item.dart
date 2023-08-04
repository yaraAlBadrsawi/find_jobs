import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/presentation/onboarding/view/widget/slider_indicator.dart';

import '../../../resource/sizes_manager.dart';
import '../../../resource/styles_manager.dart';


class OnBoardingItem extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;

  OnBoardingItem({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: HeightManager.h50),
        SvgPicture.asset(
          image,
          width: double.infinity,
          height: HeightManager.h206,
        ),
        SizedBox(height: HeightManager.h70),
        const SliderIndicator(),
        SizedBox(height: HeightManager.h50),
        Text(
          title,
          // style: getBoldTextStyle(
          //   fontSize:FontSize Manager.s34,
          //   color: ColorsManager.textColor,
          // ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: HeightManager.h20),
        Text(
          subTitle,
          // style: getTextStyle(
          //     fontSize: ManagerFontSize.s16,
          //     color: ManagerColors.textColorLight,
          //     weight: ManagerFontWeight.w300),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: HeightManager.h20),
      ],
    );
  }
}
