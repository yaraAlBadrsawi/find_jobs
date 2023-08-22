import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/model/application/application.dart';
import 'package:graduation_project/core/model/job.dart';
import 'package:graduation_project/core/network/auth/auth.dart';
import 'package:graduation_project/core/network/jobs/jobs_operation.dart';
import 'package:uuid/uuid.dart';

class JobDetailsController extends GetxController {
  late JobModel jobModel;

  @override
  void onInit() {
    super.onInit();
    print('YOU IN JOB DETAILS CONTROLLER ');
    getArgument();
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
