import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/presentation/employer/bottom_navigation/view/employer_drawer.dart';
import 'package:graduation_project/presentation/employer/home/controller/employer_controller.dart';
import 'package:graduation_project/presentation/employer/home/view/widget/job_post.dart';

import '../../../../core/resources/routes_manager.dart';
import 'widget/employer_home_box.dart';

class EmployerHomeView extends GetView<EmployerHomeController> {
  EmployerHomeView({super.key});

  final _advancedDrawerController = AdvancedDrawerController();
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
        drawer: EmployerDrawer(),
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
        controller: _advancedDrawerController,
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
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed(Routes.addJobView);
            },
            backgroundColor: ColorsManager.primary,
            child: const Icon(Icons.add),
          ),
          body: EmployerHomeBox('Find the best person to work to your jobs '),
        ));
  }
}
