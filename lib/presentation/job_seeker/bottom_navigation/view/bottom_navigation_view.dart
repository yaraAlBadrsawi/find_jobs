import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';

import '../../../../core/resources/sizes_manager.dart';
import '../../home/view/user_home_view.dart';
import '../controller/bottom_navigation_controller.dart';

class UserBottomNavigationBarView
    extends GetView<UserBottomNavigationBarController> {
  const UserBottomNavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
        index: controller.tabIndex.value,
        children: [
          // _screens[controller.tabIndex.value]

         UserHomeView(),
           // OffersScreen(),
          // CartScreen(),
        ],
      )
    ),
      bottomNavigationBar: buildBottomNavigationMenu(context),
    );
  }

  buildBottomNavigationMenu(context) {
    return Obx(
      () => SnakeNavigationBar.color(
        showSelectedLabels: true,

        ///configuration for SnakeNavigationBar.color
        selectedItemColor: ColorsManager.white,
        unselectedItemColor: ColorsManager.secondary,
        onTap: (index) => controller.changeTabIndex(index),
        snakeViewColor: ColorsManager.primary,
        currentIndex: controller.tabIndex.value,
        items: [
          BottomNavigationBarItem(
      icon: Icon(
      FontAwesomeIcons.house,
        size: IconSizeManager.s24,
      ),
        label: 'home'),


          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.codePullRequest,
                size: IconSizeManager.s24,
              ),
              label: 'application'),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.bell,
                size: IconSizeManager.s24,
              ),
              label: 'notification'),

          BottomNavigationBarItem(
              icon: Icon(
               FontAwesomeIcons.user,
                size: IconSizeManager.s24,
              ),
              label: 'profile'),
        ],
      ),
    );
  }
}
