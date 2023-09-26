
import 'package:flutter/material.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';

import 'colors_mangaer.dart';
import 'fonts_manager.dart';

class ManagerTextThemeLight extends TextTheme {
  @override
  TextStyle get displayMedium => getMediumTextStyle(
        fontSize: FontSizeManager.s20,
        color: ColorsManager.textColorLight,
      );

  @override
  TextStyle get displaySmall => getBoldTextStyle(
        fontSize: FontSizeManager.s16,
        color: ColorsManager.textColorLight,
      );

  @override
  TextStyle get headlineMedium => getMediumTextStyle(
        fontSize: FontSizeManager.s16,
        color: ColorsManager.textColorLight,
      );

  @override
  TextStyle get titleMedium => getMediumTextStyle(
        fontSize: FontSizeManager.s14,
        color: ColorsManager.textColorLight,
      );

  @override
  TextStyle get bodyLarge => getRegularTextStyle(
        fontSize: FontSizeManager.s16,
        color: ColorsManager.textColorLight,
      );
}
