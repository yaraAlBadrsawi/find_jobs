import 'package:flutter/material.dart';
import '../resources/colors_mangaer.dart';
import '../resources/fonts_manager.dart';
import '../resources/manager_text_theme_light.dart';
import '../resources/styles_manager.dart';

ThemeData managerLightThemeData() {
  return ThemeData.light().copyWith(
    useMaterial3: true,
    primaryColor: ColorsManager.primaryColor,
    primaryColorLight: ColorsManager.primaryColorLight,

    // this for disabled button colors
    disabledColor: ColorsManager.textColor,
    splashColor: ColorsManager.greyLight,
    scaffoldBackgroundColor: ColorsManager.scaffoldBackgroundColorLight,

    /// APP BAR THEME
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorsManager.greyLight,
      titleTextStyle: getBoldTextStyle(
        fontSize: FontSizeManager.s14,
        color: ColorsManager.primaryColor,
      ),
    ),

    /// BUTTON THEME
    buttonTheme: const ButtonThemeData(
      shape: RoundedRectangleBorder(),
      disabledColor: ColorsManager.greyLight,
      buttonColor: ColorsManager.buttonColorLight,
    ),

    textTheme: ManagerTextThemeLight(),
  );
}
