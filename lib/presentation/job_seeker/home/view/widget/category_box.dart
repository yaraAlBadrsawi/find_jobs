import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/routes_manager.dart';
import '../../../../../core/resources/sizes_manager.dart';

class CategoryBox extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final String image;

  const CategoryBox({
    super.key,
    required this.text,
    required this.color,
    required this.image,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          padding: EdgeInsets.zero, foregroundColor: ColorsManager.primary),
      onPressed: () {
        Get.toNamed(Routes.jobsView, arguments: text);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: HeightManager.h5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(RadiusManager.r6),
            color: color.withOpacity(0.8)),
        padding: EdgeInsets.all(WidthManager.w8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              height: HeightManager.h40,
              width: WidthManager.w40,
              // fit: BoxFit.contain, // Adjust how the SVG fits within the widget
              // alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
