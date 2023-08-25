import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/presentation/employer/application/view/emplyer_application_view.dart';
import 'package:graduation_project/presentation/employer/bottom_navigation/controller/bottom_navigation_controller.dart';
import 'package:graduation_project/presentation/employer/employer_profile/view/employer_profile_view.dart';
import 'package:graduation_project/presentation/employer/home/view/employer_home_view.dart';
import 'package:graduation_project/presentation/employer/notification/view/employer_notification_view.dart';

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
                const EmployerProfileView(),
                const EmployerNotificationView(),
                const EmployerApplicationView(),
                // OffersScreen(),
              ],
            )),
        bottomNavigationBar: ScrollToHideWidget(
          child: buildBottomNavigationMenu(context),
          controller: controller.scrollController,
        ));
  }

  buildBottomNavigationMenu(context) {
    return Obx(
      () => SnakeNavigationBar.color(
        showSelectedLabels: false,

        currentIndex: controller.tabIndex.value,
        ///configuration for SnakeNavigationBar.color
        selectedItemColor: ColorsManager.white,
        unselectedItemColor: ColorsManager.secondary,
        onTap: (index) => controller.changeTabIndex(index),
        snakeViewColor: ColorsManager.primary,

        items: [
          BottomNavigationBarItem(
              label: StringsManager.home, // home
              icon: Icon(
                FontAwesomeIcons.house,
                size: IconSizeManager.s24,
              )),
          BottomNavigationBarItem(
              label: StringsManager.empty, // profile
              icon: Icon(FontAwesomeIcons.box, size: IconSizeManager.s24)),
          BottomNavigationBarItem(
              label: StringsManager.notNow, // profile
              icon:
                  Icon(FontAwesomeIcons.solidBell, size: IconSizeManager.s24)),
          BottomNavigationBarItem(
              label: StringsManager.profile,
              icon: Icon(
                FontAwesomeIcons.solidUser,
                size: IconSizeManager.s24,
              )),
        ],
      ),
    );
  }
}

class ScrollToHideWidget extends StatelessWidget {
  final Widget child;

  final ScrollController controller;

  final Duration duration;

  bool isVisible = true;

  ScrollToHideWidget(
      {required this.child,
      required this.controller,
      this.duration = const Duration(milliseconds: 200),
      super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration,
      child: Wrap(
        children: [child],
      ),
      height: isVisible ? 56 : 0,
    );
  }
}
