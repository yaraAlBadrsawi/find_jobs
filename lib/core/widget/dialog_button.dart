import 'package:flutter/material.dart';

import '../resources/colors_mangaer.dart';
import '../resources/fonts_manager.dart';
import '../resources/sizes_manager.dart';
import '../resources/styles_manager.dart';
import 'main_button.dart';

class DialogButton extends StatelessWidget {

  final Function() onPressed;
  final String message ;

   const DialogButton({super.key,
    required this.onPressed,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return MainButton(
      onPressed: onPressed,
      color: ColorsManager.primary,
      height: HeightManager.h40, width: double.infinity,
      child:  Text(
        message,
        style: getMediumTextStyle(
          fontSize: FontSizeManager.s16,
          color: ColorsManager.white,
        ),
      ),
    );
  }
}


