import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/presentation/job_seeker/home/controller/user_home_controller.dart';
import 'package:graduation_project/presentation/job_seeker/home/view/widget/job_seeker_home_box.dart';
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
        child: const Scaffold(
          body: JobSeekerHomeBox(),
        ));
  }

}
