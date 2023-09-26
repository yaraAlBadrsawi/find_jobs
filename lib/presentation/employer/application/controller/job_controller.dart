import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../config/constants.dart';
import '../../../../core/model/job.dart';
import '../../../../core/model/user.dart';
import '../../../../core/network/application/application_db.dart';
import '../../../../core/storage/local/hive_data_store/hive_data_store.dart';

class JobController extends GetxController {
  late var applications = [].obs;
  late var jobApplication = [];
  late JobWithEmployer _jobWithEmployer;

  @override
  void onInit() {
    super.onInit();
    getArgument();
    getJobApplication();
  }

  getArgument() {
    if (Get.arguments != null) {
      _jobWithEmployer = Get.arguments;
      if (HiveService().getItem(Constants.user).userType == UserType.employer.name) {}
      print('ARGUMNET ==> ${Get.arguments}');
      print('ARGUMNET JOB ID IS ==> ${Get.arguments.job.jobId}');
      update();
    }
  }

  void getJobApplication() async {
    applications.value = await ApplicationDB()
        .getEmployerApplications(HiveService().getItem(Constants.user).userID);
    print('current application=> ${applications.value}');
    for (var application in applications.value) {
      if (application.application.jobId == _jobWithEmployer.job.jobId) {
        jobApplication.add(application);
        print('job application added is=> ${jobApplication}');
      }
    }
    update();
  }
}
