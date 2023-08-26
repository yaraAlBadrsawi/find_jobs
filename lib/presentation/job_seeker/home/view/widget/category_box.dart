import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter_svg/svg.dart';

import '../../../../../core/resources/fonts_manager.dart';
import '../../../../../core/resources/sizes_manager.dart';
import '../../../../../core/resources/styles_manager.dart';

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
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: WidthManager.w20,
          vertical: HeightManager.h5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RadiusManager.r6),
          color: color.withOpacity(0.5)),
      padding: EdgeInsets.all(WidthManager.w8),
      child: Column(
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: getRegularTextStyle(
              fontSize: FontSizeManager.s10,
              color: Colors.black,
            )),
          SvgPicture.asset(
            image,
            height: HeightManager.h50,
            width: WidthManager.w50,
            // fit: BoxFit.contain, // Adjust how the SVG fits within the widget
            // alignment: Alignment.center,
          ),


        ],
      ),
    );
  }
}
