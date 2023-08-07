import 'package:flutter/material.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';

import '../../../../core/widget/main_button.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';

class CircleButton extends StatelessWidget {
   final Function() onPressed ;
  final IconData iconData ;

   const CircleButton({super.key,
  required this.onPressed,
  required this.iconData  ,
  }
  );

  @override
  Widget build(BuildContext context) {
    return MainButton(
       child: Icon(
      iconData,
      color: ColorsManager.white,
    ),

    color:    ColorsManager.secondary ,onPressed:  onPressed,

      width: WidthManager.w50,
      height: HeightManager.h50,
      radius: RadiusManager.r40,


    );
  }
}


