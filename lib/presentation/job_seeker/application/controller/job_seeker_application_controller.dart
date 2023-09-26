import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:graduation_project/config/constants.dart';
import 'package:graduation_project/core/network/application/application_db.dart';
import 'package:graduation_project/core/storage/local/hive_data_store/hive_data_store.dart';

class JobSeekerApplicationController extends GetxController {
  final advancedDrawerController = AdvancedDrawerController();
  late String jobId;
  var applications = [].obs;
  late var reviewApplications = [].obs;
  late var  completedApplications = [].obs;

  @override
  void onInit() {
    getReviewApplication();
    print('Hi i am in on Init ');
    super.onInit();
  }

  void getReviewApplication() async {
    applications.value = await ApplicationDB()
        .getJobSeekerApplications(HiveService().getItem(Constants.user).userID);
    print('applications.value === ${applications.value}');
    for (var application in applications. value) {
      print('application in for is => ${application}');
      print('application in for is => ${application.application.isReview}');
      if (application.application.isReview) {
        completedApplications.add(application);
      } else {
        reviewApplications.add(application);
      }
    }
    update();
  }


  void getCompletetedApplication() async {
    applications.value = await ApplicationDB()
        .getJobSeekerApplications(HiveService().getItem(Constants.user).userID);
    print('applications.value === ${applications.value}');
    for (var application in applications. value) {
      print('application in for is => ${application}');
      print('application in for is => ${application.application.isReview}');
      if (application.application.isReview) {
        completedApplications.add(application);
      } else {
        reviewApplications.add(application);
      }
    }
    update();
  }
}
