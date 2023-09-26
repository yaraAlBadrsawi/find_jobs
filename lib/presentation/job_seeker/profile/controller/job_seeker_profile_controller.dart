import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:graduation_project/config/constants.dart';
import 'package:graduation_project/core/network/auth/user_db.dart';
import 'package:graduation_project/core/storage/local/hive_data_store/hive_data_store.dart';

import '../../../../core/model/application/application_details.dart';
import '../../../../core/model/job_seeker/job_seeker_model.dart';

class JobSeekerProfileController extends GetxController
    with GetTickerProviderStateMixin
{
  late JobSeekerModel jobSeeker;
  late TabController tabController;
  late Application application;
  getArgument() {
    print('get ARgument her ');
    if (Get.arguments != null) {
      application = Get.arguments;
      // if (HiveService()
      //     .getItem(Constants.user)
      //     .userType ==
      //     UserType.employer.name) {
      //   isEmployer = true;
      // }
      print('ARGUMNET ==> ${Get.arguments}');
      update();
    }
  }

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this, animationDuration: const Duration(milliseconds: 850),);
getArgument();
    getJobSeekerData();
    super.onInit();
  }

  getJobSeekerData() async {
    jobSeeker = await JobSeekerDB().getJobSeeker(HiveService().getItem(Constants.user).userID);

    print('jobSeeker Model => $jobSeeker');
    update();
  }
}