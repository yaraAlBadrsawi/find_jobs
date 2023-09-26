import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import '../util/size_util.dart';

class MainButton extends StatelessWidget {
  final Widget child;
  final double? width;
  final double height;
  final Function() onPressed;
  final Color color;
  final Color shadow;
  final double radius; // optional
  final double horizontalMargin;


  MainButton(
      {super.key,
      required this.child,
      this.width,
      required this.height,
      required this.color,
      required this.onPressed,
        this.shadow = Colors.transparent,
      double? horizontalMargin,
      double? radius})
      : radius = radius ?? SizeUtil.setRadius(RadiusManager.r10),
        horizontalMargin =
            horizontalMargin ?? SizeUtil.setWidth(WidthManager.w0);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(
          vertical: HeightManager.h10, horizontal: horizontalMargin),
      decoration: BoxDecoration(
          // border: color == ColorsManager.primary
          //     ? const Border.fromBorderSide(BorderSide.none)
          //     : Border.all(width: 1, color: ColorsManager.grey),
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          color: color),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shadowColor: shadow,
            backgroundColor: ColorsManager.transparent,
          ),
          child: child),
    );
  }
}
