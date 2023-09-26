import 'package:get/get.dart';

import '../../../../config/constants.dart';
import '../../../../core/network/jobs/jobs_db.dart';
import '../../../../core/storage/local/hive_data_store/hive_data_store.dart';

class JobsController extends GetxController{

  var jobsWithEmployer = [].obs;

 late String categoryName;
  @override
  void onInit() {
    super.onInit();
    getArgument();
    getJobs();
  }

  getArgument() {
    print('get ARgument her ');
    if (Get.arguments != null) {
      categoryName = Get.arguments;
      print('ARGUMNET ==> ${categoryName}');
    }
  }

  void getJobs() async {
    print('current user is => ${HiveService().getItem(Constants.user).userID}');
    jobsWithEmployer.value =
    await JobsDB().getJobsByCategory(categoryName);
    print('jobsWithEmployer length is => ${jobsWithEmployer.length}');
    update();
  }
}