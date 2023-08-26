import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/model/application/application.dart';
import 'package:graduation_project/core/model/employer/employer_model.dart';
import 'package:graduation_project/core/model/job.dart';
import 'package:graduation_project/core/network/auth/auth.dart';
import 'package:graduation_project/core/network/jobs/jobs_operation.dart';
import 'package:uuid/uuid.dart';

import '../../../../config/constants.dart';
import '../../../../core/model/user.dart';
import '../../../../core/network/auth/user_operation.dart';
import '../../../../core/storage/local/hive_data_store/hive_data_store.dart';

class EmployerJobDetailsController extends GetxController {
  late JobModel jobModel;
  late EmployerModel employer;

  @override
  void onInit() {
    super.onInit();
    getArgument();
    getEmployer();
    print('argument => ${Get.arguments}');
  }

  getArgument() {
    print('get ARgument her ');
    if (Get.arguments != null) {
      jobModel = Get.arguments;
      print('ARGUMNET ==> ${Get.arguments}');
      print('JOB ID  ==> ${jobModel.jobId}');
    }
  }


  getEmployer() async {

    print('employer id = ${jobModel.employerId}');
    employer = await EmployerDB().getEmployers(jobModel.employerId);
    print('employer => $employer');
    update();
  }

  ApplicationModel get application {
    ApplicationModel applicationModel = ApplicationModel();
    applicationModel.applicationId = const Uuid().v4();
    applicationModel.jobSeekerId = Authenticate().getCurrentUserId();
    applicationModel.applicationStatus = false;
    applicationModel.applyTime = Timestamp.now();
    return applicationModel;
  }

  applyToJob() {
    print('job id => ${jobModel.jobId}');
    print('current user id => ${Authenticate().getCurrentUserId()}');
    JobsDB().addApplication(application);
    update();
  }
}
