import 'package:flutter/material.dart';
import 'package:graduation_project/presentation/resource/colors_mangaer.dart';

import '../../../../core/widget/main_button.dart';
import '../../../resource/sizes_manager.dart';

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
        Icon(
      iconData,
      color: ColorsManager.white,
    ),

        ColorsManager.secondary , () => onPressed,
      shapeBorder: const CircleBorder(),

      minWidth: WidthManager.w50,
      height: HeightManager.h50,
    );
  }
}


