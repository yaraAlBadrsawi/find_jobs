import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';

import '../../../presentation/job_seeker/bottom_navigation/view/widget/drawer_item.dart';
import '../../../presentation/job_seeker/home/controller/user_home_controller.dart';
import '../../resources/sizes_manager.dart';
import '../../resources/strings_manager.dart';

class DrawerWidget extends StatelessWidget {
  final List<String> titles;
  final List<IconData> iconData;
  final Function() onTap;

  const DrawerWidget(
      {required this.titles,
      required this.iconData,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
        textColor: ColorsManager.white,
        iconColor: ColorsManager.white,
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          Expanded(
            child: ListView.builder(
              itemCount: titles.length,
              itemBuilder: (context, index) {
                return DrawerItem(
                  title: titles[index],
                  icon: iconData[index],
                  onTap: onTap,
                );
              },
              padding: EdgeInsets.zero,
            ),
          ),
        ]));
  }
}
