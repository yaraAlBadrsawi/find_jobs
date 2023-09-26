import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:get/get.dart';
import 'package:graduation_project/config/constants.dart';
import 'package:graduation_project/core/model/employer/employer_model.dart';
import 'package:graduation_project/core/model/job.dart';
import 'package:graduation_project/core/model/user.dart';
import 'package:graduation_project/core/network/auth/user_db.dart';
import '../../../../core/storage/local/hive_data_store/hive_data_store.dart';

class EmployerProfileController extends GetxController
    with GetTickerProviderStateMixin
{
  var email = ''.obs;
  var name = ''.obs;
  var phoneNumber = ''.obs;

  var employerModel = EmployerModel();
late  UserModel userModel ;
  var address = '';

  late TabController tabController;
  late JobWithEmployer jobWithEmployer;
  getArgument() {
    print('get ARgument her ');
    if (Get.arguments != null) {
      jobWithEmployer = Get.arguments;
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
    super.onInit();
    tabController = TabController(length: 2, vsync: this, animationDuration: const Duration(milliseconds: 850),);
   getArgument();
    getEmployerData();
  }

  getEmployerData() async {
   userModel= HiveService().getItem(Constants.user);
      employerModel = await EmployerDB().getEmployers(userModel.userID);
     print('employer Model => $employerModel');
      update();
  }


}
