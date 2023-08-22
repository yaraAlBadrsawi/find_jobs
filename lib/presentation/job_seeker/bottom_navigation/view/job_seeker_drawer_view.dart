import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/presentation/job_seeker/bottom_navigation/view/widget/drawer_item.dart';
import 'package:graduation_project/presentation/job_seeker/home/controller/user_home_controller.dart';
import 'package:hidden_drawer_menu/controllers/simple_hidden_drawer_controller.dart';

import '../../../../core/widget/drawer/drawer_widget.dart';

class JobSeekerDrawer extends GetView<UserHomeController> {
  JobSeekerDrawer({super.key});

  List<String> titles = [
    StringsManager.findJob,
    StringsManager.savedJob,
    StringsManager.logout,
    StringsManager.about,
    StringsManager.setting,
  ];

  List<IconData> iconsList = [
    FontAwesomeIcons.searchengin,
    FontAwesomeIcons.bookmark,
    FontAwesomeIcons.arrowRightFromBracket,
    FontAwesomeIcons.addressCard,
    FontAwesomeIcons.gear,
  ];

  List<Function()> onTaps = [
    () {}, () {},
    () {}, // logout
    () {},
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

