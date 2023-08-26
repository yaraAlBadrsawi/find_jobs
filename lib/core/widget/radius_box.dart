
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/fonts_manager.dart';
import '../resources/sizes_manager.dart';
import '../resources/styles_manager.dart';
import '../util/size_util.dart';

class RadiusBox extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;


  const RadiusBox({
    super.key,
    required this.text,
    required this.color,

    this.fontSize= 16,

  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RadiusManager.r6),
          color: color.withOpacity(0.5)),
      padding: EdgeInsets.all(WidthManager.w8),
      child: Column(
        children: [


          Text(text, textAlign:  TextAlign.center ,style: getRegularTextStyle(
              fontSize: FontSizeManager.s16, color: Colors.black,),),
        ],
      ),
    );
  }
}
