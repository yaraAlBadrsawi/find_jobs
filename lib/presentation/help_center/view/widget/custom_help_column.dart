import 'package:flutter/material.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/fonts_manager.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';


class CustomHelpColumn extends StatelessWidget {
  final String text;
  final double paddingBottom;
  const CustomHelpColumn({Key? key, required this.text, this.paddingBottom = 24}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24, 0, 24, paddingBottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text,style: getRegularTextStyle(fontSize: FontSizeManager.s14,
              color: ColorsManager.black),),
           SizedBox(height:HeightManager.h12,),
          const Divider(
            color: ColorsManager.grey,
            height: 1,
            thickness: 1,
          )
        ],
      ),
    );
  }
}