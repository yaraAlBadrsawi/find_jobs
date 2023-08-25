import 'package:awesome_drawer_bar/awesome_drawer_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:graduation_project/config/constants.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/core/widget/home_box.dart';
import 'package:graduation_project/presentation/job_seeker/home/controller/user_home_controller.dart';
import 'package:graduation_project/presentation/job_seeker/home/view/widget/job_seeker_home_box.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/widget/radius_box.dart';
import '../../bottom_navigation/view/job_seeker_drawer_view.dart';

class UserHomeView extends GetView<UserHomeController> {
  UserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
        drawer: JobSeekerDrawer(),
        backdrop: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [ColorsManager.primary, Colors.blueGrey.withOpacity(0.2)],
            ),
          ),
        ),
        controller: controller.advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        // openScale: 1.0,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),

        child: Scaffold(

          // key:_key,
          body:

          // Sliver list
          JobSeekerHomeBox()  ,


        ));
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    controller.advancedDrawerController.showDrawer();
  }
}
