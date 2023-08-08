import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';

import '../../../../core/resources/sizes_manager.dart';
import '../controller/bottom_navigation_controller.dart';

class UserBottomNavigationBarView
    extends GetView<UserBottomNavigationBarController> {
  const UserBottomNavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
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
              label: StringsManager.empty,
              icon: Icon(Icons.home_outlined, size: IconSizeManager.s24)),
          BottomNavigationBarItem(
              label: StringsManager.empty,
              icon: Icon(
                Icons.person_2_outlined,
                size: IconSizeManager.s24,
              )),
          BottomNavigationBarItem(
              label: StringsManager.empty,
              icon: Icon(
                Icons.local_offer_outlined,
                size: IconSizeManager.s24,
              )),
          BottomNavigationBarItem(
              label: StringsManager.empty,
              icon: Icon(Icons.shopping_cart_outlined,
                  size: IconSizeManager.s24)),
          BottomNavigationBarItem(
              label: StringsManager.empty, // drawer
              icon: Icon(Icons.menu,
                  size: IconSizeManager.s24)),
        ],
      ),
    );
  }
}
