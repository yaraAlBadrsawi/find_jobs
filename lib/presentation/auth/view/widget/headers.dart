
import 'package:flutter/material.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';

import 'package:graduation_project/core/resources/fonts_manager.dart';

class Header extends StatelessWidget {
  final String head;
  final bool isSelect  ;
   const Header({super.key,
    required this.head,  this.isSelect = true,
  })
  ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isSelect == true ? HeightManager.h52 : HeightManager.h40,
      width: isSelect == true ? WidthManager.w110 : WidthManager.w100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isSelect == true
              ? ColorsManager.white
              : ColorsManager.white.withOpacity(.98),
          borderRadius:  BorderRadius.only(
            topLeft: Radius.circular(RadiusManager.r30),
            topRight: Radius.circular(RadiusManager.r30),
          ),
          boxShadow: [
            isSelect == false
                ? const BoxShadow(color: ColorsManager.primary)
                : BoxShadow(
              color: ColorsManager.black.withOpacity(.1),
              offset: const Offset(0, -1),
              blurRadius: 2,
            )
          ]),
      child: Text(
        head,
        textAlign: TextAlign.center,
        style: isSelect == true
            ? getBoldTextStyle(fontSize: FontSizeManager.s16, color: ColorsManager.secondary)
            : getMediumTextStyle(fontSize: FontSizeManager.s14, color: ColorsManager.black)


        ),

    );
  }
}
