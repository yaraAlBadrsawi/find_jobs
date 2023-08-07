import 'dart:ui';
import 'package:flutter/cupertino.dart';

import 'colors_mangaer.dart';
import 'fonts_manager.dart';
// class TextStyleManager{
//
//   static TextStyle appTextStyle({
//     double size = 16,
//     Color? color,
//     FontWeight? weight,
//     double letterSpacing = 1.5,
//     TextOverflow? overFlow,
//     TextDecoration? decoration,
//   }) {
//     return TextStyle(
//         fontSize: size,
//         color: color,
//         fontWeight: weight,
//         letterSpacing: letterSpacing,
//         overflow: overFlow,
//         decoration: decoration);
//   }
//
//   static TextStyle getLarge({Color color = ColorsManager.black}) {
//     return appTextStyle(
//       size: 38,
//       color: color,
//       weight: FontWeight.bold,
//     );
//   }
//
//
//   static TextStyle getRegularTextStyle({
//     required double fontSize,
//     required Color color,
//     TextDecoration decoration = TextDecoration.none,
//   }) {
//     return _textStyle(
//       fontSize: fontSize,
//       fontFamily: FontFamilyManager.fontFamily,
//       fontWeight: FontWeightManager.regular,
//       color: color,
//       decoration: decoration,
//     );
//   }
//
//
// }


import 'package:flutter/material.dart';

TextStyle _textStyle({
  required double fontSize,
  required String fontFamily,
  required FontWeight fontWeight,
  required Color color,
  required TextDecoration decoration,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color,
    decoration: decoration,
  );
}

TextStyle getRegularTextStyle({
  required double fontSize,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
}) {
  return _textStyle(
    fontSize: fontSize,
    fontFamily: FontFamilyManager.fontFamily,
    fontWeight: FontWeightManager.regular,
    color: color,
    decoration: decoration,
  );
}

TextStyle getBoldTextStyle({
  required double fontSize,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
}) {
  return _textStyle(
    fontSize: fontSize,
    fontFamily: FontFamilyManager.fontFamily,
    fontWeight: FontWeightManager.bold,
    color: color,
    decoration: decoration,
  );
}

TextStyle getMediumTextStyle({
  required double fontSize,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
}) {
  return _textStyle(
    fontSize: fontSize,
    fontFamily: FontFamilyManager.fontFamily,
    fontWeight: FontWeightManager.medium,
    color: color,
    decoration: decoration,
  );
}

TextStyle getTextStyle({
  required double fontSize,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
  FontWeight? weight,
}) {
  return _textStyle(
    fontSize: fontSize,
    fontFamily: FontFamilyManager.fontFamily,
    fontWeight: weight ?? FontWeightManager.medium,
    color: color,
    decoration: decoration,
  );
}

