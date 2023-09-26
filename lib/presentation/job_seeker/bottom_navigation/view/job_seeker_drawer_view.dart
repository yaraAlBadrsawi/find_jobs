import 'dart:core';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/resources/routes_manager.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/presentation/job_seeker/home/controller/user_home_controller.dart';
import '../../../../config/theam_controller.dart';
import '../../../../core/resources/colors_mangaer.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/widget/dialog.dart';
import '../../../../core/widget/drawer/drawer_item.dart';
import '../../../../core/widget/drawer/drawer_widget.dart';
import '../../../../core/widget/main_button.dart';

class JobSeekerDrawer extends GetView<UserHomeController> {
  JobSeekerDrawer({super.key});

  List<String> titles = [
    StringsManager.setting,
    StringsManager.about,
    StringsManager.message,
    StringsManager.feedBack,
    StringsManager.findJob,
    StringsManager.savedJob,
    StringsManager.freelancerJobs,
    StringsManager.logout,
  ];

  List<IconData> iconsList = [
    FontAwesomeIcons.gear,
    FontAwesomeIcons.addressCard,
    FontAwesomeIcons.message,
    FontAwesomeIcons.star,
    FontAwesomeIcons.searchengin,
    FontAwesomeIcons.bookmark,
    Icons.work,
    FontAwesomeIcons.arrowRightFromBracket,

  ];

  @override
  Widget build(BuildContext context) {
    return DrawerWidget(titles: titles, iconData: iconsList,);
  }
}

class DrawerWidget extends GetView<UserHomeController> {
  final List<String> titles;
  final List<IconData> iconData;
  final ThemeController themeController = Get.put(ThemeController());


   DrawerWidget(
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

           Flexible(
            child: ListView.builder(
              itemCount: titles.length,
              itemBuilder: (context, index) {
                return DrawerItem(
                  title: titles[index],
                  icon: iconData[index], onTap: () {
                    if(titles[index]== StringsManager.logout ){
                      DialogUtil.showCustomDialog(
                          title: 'Are you sure you want to log out?',
                          content: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(RadiusManager.r10))),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MainButton(
                                        height: HeightManager.h50,
                                        width: WidthManager.w80,
                                        color: ColorsManager.red,
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text(
                                          StringsManager.cancel,
                                          style: getRegularTextStyle(
                                              fontSize: FontSizeManager.s16,
                                              color: ColorsManager.white),
                                        )),
                                    SizedBox(
                                      width: WidthManager.w20,
                                    ),
                                    MainButton(
                                        height: HeightManager.h50,
                                        width: WidthManager.w80,
                                        color: ColorsManager.green,
                                        onPressed: () {
                                          controller.signOut();
                                        },
                                        child: Text(
                                          StringsManager.yes,
                                          style: getRegularTextStyle(
                                              fontSize: FontSizeManager.s16,
                                              color: ColorsManager.white),
                                        )),
                                  ],
                                )
                                // text
                              ],
                            ),
                          ),
                          actionText: '');

                    }else if(titles[index] == StringsManager.setting){
                      Get.toNamed(Routes.setting);
                    }
    // else if(titles[index] == StringsManager.setting){
                    //
                    // }

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
