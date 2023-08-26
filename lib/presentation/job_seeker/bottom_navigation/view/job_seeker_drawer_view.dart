import 'dart:core';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/resources/routes_manager.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/presentation/job_seeker/home/controller/user_home_controller.dart';
import '../../../../core/resources/colors_mangaer.dart';
import '../../../../core/widget/drawer/drawer_item.dart';
import '../../../../core/widget/drawer/drawer_widget.dart';

class JobSeekerDrawer extends GetView<UserHomeController> {
  JobSeekerDrawer({super.key});

  List<String> titles = [
    StringsManager.findJob,
    StringsManager.savedJob,
    StringsManager.freelancerJobs,
    StringsManager.about,
    // StringsManager.setting,
    StringsManager.logout,
  ];

  List<IconData> iconsList = [
    FontAwesomeIcons.searchengin,
    FontAwesomeIcons.bookmark,
    FontAwesomeIcons.arrowRightFromBracket,
    FontAwesomeIcons.addressCard,
    FontAwesomeIcons.arrowRightFromBracket,

    // FontAwesomeIcons.gear,
  ];

  @override
  Widget build(BuildContext context) {
    return DrawerWidget(titles: titles, iconData: iconsList,);
  }
}

class DrawerWidget extends GetView<UserHomeController> {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
          SizedBox(height: HeightManager.h200,),
           Flexible(
            child: ListView.builder(
              itemCount: titles.length,
              itemBuilder: (context, index) {
                return DrawerItem(
                  title: titles[index],
                  icon: iconData[index], onTap: () {
                    if(titles[index]== StringsManager.logout ){
                      controller .signOut();
                    }

                },

                );
              },
              padding: EdgeInsets.zero,
            ),


          ),
           DrawerItem(title: StringsManager.editInterest,
               icon: FontAwesomeIcons.gear,
               onTap:() {Get.toNamed(Routes.interestView);})
        ]));
  }


}
