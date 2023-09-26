import 'package:flutter/cupertino.dart';
import '../resources/colors_mangaer.dart';
import '../resources/fonts_manager.dart';
import '../resources/sizes_manager.dart';
import '../resources/styles_manager.dart';

class DetailsBox extends StatelessWidget {
  final IconData icon;
  final String text;

  const DetailsBox(this.icon,
      this.text, {
        super.key,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: WidthManager.w15, vertical: HeightManager.h5), child: Row(
      children: [
        Icon(
          icon,
          color: ColorsManager.primary,
        ),
        SizedBox(
          width: WidthManager.w10,
        ),
        Text(
          text,
          style: getRegularTextStyle(
              fontSize: FontSizeManager.s14, color: ColorsManager.black),
        ),
      ],
    ),
    );
  }
}