
import 'package:flutter/material.dart';

import '../../config/constants.dart';
import '../resources/colors_mangaer.dart';
import '../resources/fonts_manager.dart';
import '../resources/manager_text_theme_dark.dart';
import '../resources/styles_manager.dart';


ThemeData managerDarkThemeData() {
  return ThemeData.dark().copyWith(
    useMaterial3: true,

    /// MAIN COLORS APP
    primaryColor: ColorsManager.primary,
    primaryColorDark: ColorsManager.primaryDark,

    // this for disabled button colors
    disabledColor: ColorsManager.disabledColor,
    splashColor: ColorsManager.greyLight,
    scaffoldBackgroundColor: ColorsManager.scaffoldBackgroundColorDark,

    /// APP BAR THEME
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorsManager.greyLight,

      titleTextStyle: getBoldTextStyle(
        fontSize:FontSizeManager.s14,
        color: ColorsManager.primaryColor,
      ),
    ),

    /// BUTTON THEME
    buttonTheme: const ButtonThemeData(
      shape: RoundedRectangleBorder(),
      disabledColor: ColorsManager.greyLight,
      buttonColor: ColorsManager.buttonColorDarK,
    ),

    textTheme: ManagerTextThemeDark(),
  );
}
