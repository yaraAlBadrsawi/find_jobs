import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';

import '../../../../config/theam_controller.dart';
import '../../../../core/resources/colors_mangaer.dart';
import '../../../../core/resources/routes_manager.dart';
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
    StringsManager.message,
    StringsManager.feedBack,
    StringsManager.logout,
    // help center
  ];

  List<IconData> iconsList = [
    FontAwesomeIcons.gear,
    FontAwesomeIcons.addressCard,
    FontAwesomeIcons.message,
    FontAwesomeIcons.star,
    FontAwesomeIcons.arrowRightFromBracket,

  ];

@override
Widget build(BuildContext context) {
  return DrawerWidget(
    titles: titles,
    iconData: iconsList,
  );
}}

class DrawerWidget extends GetView<EmployerHomeController> {
  final List<String> titles;
  final List<IconData> iconData;
  final ThemeController themeController = Get.put(ThemeController());

  DrawerWidget({required this.titles,
    required this.iconData,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
        textColor: ColorsManager.white,
        iconColor: ColorsManager.white,
        child: Column(children: [
          SizedBox(height: HeightManager.h200,),
          Obx(() {
            return Row(
              children: [
                SizedBox(width: WidthManager.w10),
                const Icon(Icons.light_mode),
                SizedBox(width: WidthManager.w15),
                Expanded(
                  child: SwitchListTile(
                    title: const Text('Dark Mode'),
                    value: themeController.isDarkMode.value,
                    activeColor: ColorsManager.borderSide,
                    onChanged: (value) {
                      themeController.toggleTheme();
                    },
                  ),
                ),
              ],
            );
          }),

          Expanded(
            child: ListView.builder(
              itemCount: titles.length,
              itemBuilder: (context, index) {
                return DrawerItem(
                  title: titles[index],
                  icon: iconData[index],
                  onTap: () {
                    print('clicked ');

                    if (titles[index] == StringsManager.logout) {
                      print('sign out clicked ');
                      controller.signOut();
                    }else if(titles[index] == StringsManager.setting){
                      print('setting');
                      Get.toNamed(Routes.setting);
                    }
                  },
                );
              },
              padding: EdgeInsets.zero,
            ),
          ),

        ])


    );
  }
}
