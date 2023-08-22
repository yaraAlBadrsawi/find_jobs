import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/presentation/employer/bottom_navigation/controller/bottom_navigation_controller.dart';
import 'package:graduation_project/presentation/employer/employer_profile/view/employer_profile_view.dart';
import 'package:graduation_project/presentation/employer/home/view/employer_home_view.dart';

import '../../../../core/resources/sizes_manager.dart';

class EmployerBottomNavigationBarView
    extends GetView<EmployerBottomNavigationBarController> {
  const EmployerBottomNavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: _screens[_currentIndex],
        body: Obx(() => IndexedStack(
              index: controller.tabIndex.value,
              children: [
                // _screens[controller.tabIndex.value]

                EmployerHomeView(),
                EmployerProfileView(), // OffersScreen(),
                // CartScreen(),
              ],
            )

        ),
        bottomNavigationBar: buildBottomNavigationMenu(context));
  }

  buildBottomNavigationMenu(context) {
    return Obx(
      () => BottomNavigationBar(
        selectedIconTheme: const IconThemeData(color: ColorsManager.primary),
        currentIndex: controller.tabIndex.value,
        onTap: (index) => controller.changeTabIndex(index),
        unselectedIconTheme: const IconThemeData(color: ColorsManager.grey),
        items: [
          BottomNavigationBarItem(
              label: StringsManager.empty, // home
              icon: Icon(
                Icons.home,
                size: IconSizeManager.s24,
              )),
          BottomNavigationBarItem(
              label: StringsManager.empty,
              icon: Icon(
                Icons.person, //order
                size: IconSizeManager.s24,
              )),
          BottomNavigationBarItem(
              label: StringsManager.empty, // profile
              icon: Icon(Icons.add_box, size: IconSizeManager.s24)),
        ],
      ),
    );
  }
}
