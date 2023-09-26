import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import '../../../../config/constants.dart';
import '../../../../core/model/job.dart';
import '../../../../core/model/user.dart';
import '../../../../core/network/application/application_db.dart';
import '../../../../core/storage/local/hive_data_store/hive_data_store.dart';

class EmployerApplicationController extends GetxController {
  final advancedDrawerController = AdvancedDrawerController();
  var applications = [].obs;
  late var reviewApplications = [].obs;
  late var completedApplication = [].obs;
  late JobWithEmployer jobWithEmployer;
  var applicationStatue=false.obs;

  @override
  void onInit() {
    getReviewApplication();
    super.onInit();
  }



  void getReviewApplication() async {
    applications.value = await ApplicationDB()
        .getEmployerApplications(HiveService().getItem(Constants.user).userID);
    for (var application in applications.value) {
      if (!application.application.isReview) {
        print('review Application => $applications');
        reviewApplications.add(application);
      } else {
        completedApplication.add(application);
        print('complete Application => $completedApplication');
      }
    }
    update();
  }



  void getCompletedApplication(item) {
    item.application.isReview=true;
    reviewApplications.remove(item);
    print('current item isReivew ${item.application.isReview}');
    print('application status => ${applicationStatue.value}');
    ApplicationDB().updateApplication(item.application,applicationStatue.value);
   print('item=> $item');
   print('item=> ${item.application.applicationStatus}');
    completedApplication.add(item);
    update();
  }
 void  getJobApplication(){
    ApplicationDB().getJobApplications(HiveService().getItem(Constants.user).userID,
        jobWithEmployer.job.jobId);
  }
}
