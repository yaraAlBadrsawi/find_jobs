import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/core/resources/fonts_manager.dart';

import '../../../../core/resources/routes_manager.dart';

class EmployerHomeView extends StatelessWidget {
  const EmployerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.toNamed(Routes.addJobView);

      },),
      body: Center(child: Text('EmployerHomeView',style: TextStyle(fontSize: FontSizeManager.s50),))
      ,
    );
  }
}
