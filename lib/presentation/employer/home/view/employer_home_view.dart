import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/presentation/employer/bottom_navigation/view/employer_drawer.dart';
import 'package:graduation_project/presentation/employer/home/controller/employer_controller.dart';
import 'package:graduation_project/presentation/employer/home/view/widget/job_post.dart';

import '../../../../core/resources/routes_manager.dart';
import '../../../../core/widget/home_box.dart';

class EmployerHomeView extends GetView<EmployerHomeController> {
  const EmployerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:EmployerDrawer() ,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.addJobView);
        },
        backgroundColor: ColorsManager.primary,
        child: const Icon(Icons.add),
      ),

      body: HomeBox('Find the best person to work to your jobs '),
    );
  }
}
