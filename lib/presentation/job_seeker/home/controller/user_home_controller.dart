import 'package:flutter/cupertino.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/network/auth/auth.dart';
import 'package:hive/hive.dart';

import '../../../../core/model/employer/employer_model.dart';
import '../../../../core/model/job.dart';
import '../../../../core/network/auth/user_operation.dart';
import '../../../../core/network/jobs/jobs_operation.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/storage/local/hive_data_store/hive_data_store.dart';

class UserHomeController extends GetxController {
  var jobsList = [].obs;
  var currentIndex = 0.obs;
  var isDrawerOpen = false.obs;

  // UserModel userModel = UserModel();
  EmployerModel employerModel = EmployerModel();
  final advancedDrawerController = AdvancedDrawerController();

  // var formKey = GlobalKey<FormState>();


  void signOut(){
    Authenticate().signOut() ;
    //delete from hive
    // HiveService().;
  }

  ChangeDrawerStatus() {
    isDrawerOpen.value = !isDrawerOpen.value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    advancedDrawerController.showDrawer();
    getJobs();
//    getEmployer();
  }

  void getEmployer(String employerId) async {
    employerModel = await EmployerDB().getEmployers(employerId);
    update();
  }

  void getJobs() async {
    jobsList.value = await JobsDB().getJobSeekerJobs();
    print('Job Model List ID => $jobsList');
    update();
  }

// void setCurrentIndex(int index) {
//   currentIndex.value = index;
//   update();
// }
}
