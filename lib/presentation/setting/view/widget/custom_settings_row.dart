import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/resources/assets_manager.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/fonts_manager.dart';

import '../../../../core/resources/styles_manager.dart';


class CustomSettingsRow extends StatelessWidget {
 final Function()? onTap;
  final EdgeInsetsGeometry? margin;
  final String title;
  final IconData icon;

   const CustomSettingsRow(
      {Key? key,
        this.onTap,
        this.margin,
        required this.title,
        required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
            color: ColorsManager.secondary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            Icon(icon,color: ColorsManager.primary,),
            const SizedBox(
              width: 20,
            ),
          Text(title,style: getRegularTextStyle(fontSize: FontSizeManager.s16,color: ColorsManager.black),),
             Spacer(),
            SvgPicture.asset(
              AssetsManager.arrow,
              color: ColorsManager.grey,
            ),
          ],
        ),
      ),
    );
  }
}