import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/assets_manager.dart';

class JobSeekerNotificationView extends StatelessWidget {
  const JobSeekerNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.red,
        margin: EdgeInsets.all(20),
        child:
      SvgPicture.asset(
      AssetsManager.sales,
        height: HeightManager.h100,
        width: WidthManager.w100,
        // fit: BoxFit.contain, // Adjust how the SVG fits within the widget
        // alignment: Alignment.center,
      )
        ,),
    );
  }
}
