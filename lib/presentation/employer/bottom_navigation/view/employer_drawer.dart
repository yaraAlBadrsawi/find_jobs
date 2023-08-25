import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../core/resources/colors_mangaer.dart';
import '../../../../core/resources/sizes_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widget/drawer/drawer_item.dart';
import '../../../../core/widget/drawer/drawer_widget.dart';
import '../../home/controller/employer_controller.dart';

class EmployerDrawer extends GetView<EmployerHomeController> {
  EmployerDrawer({super.key});

  List<String> titles = [
    StringsManager.setting,
    StringsManager.about,
    StringsManager.logout,
  ];

  List<IconData> iconsList = [
    FontAwesomeIcons.arrowRightFromBracket,
    FontAwesomeIcons.addressCard,
    FontAwesomeIcons.gear,
  ];

  List<Function()> onTaps = [
    () {},
  ];

  @override
  Widget build(BuildContext context) {
    return DrawerWidget(
      titles: titles,
      iconData: iconsList,
    );
  }
}

class DrawerWidget extends GetView<EmployerHomeController> {
  final List<String> titles;
  final List<IconData> iconData;

  const DrawerWidget(
      {required this.titles,
      required this.iconData,
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
                  onTap: (){
                    if(titles == StringsManager.logout){
                      controller.signOut();
                    }
                  },
                );
              },
              padding: EdgeInsets.zero,
            ),
          ),
        ]));
  }
}
