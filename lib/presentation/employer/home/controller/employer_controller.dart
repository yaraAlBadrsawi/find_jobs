import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/model/employer/employer_model.dart';
import 'package:graduation_project/core/model/job.dart';
import 'package:graduation_project/core/network/auth/auth.dart';
import 'package:graduation_project/core/network/auth/user_operation.dart';
import 'package:graduation_project/core/network/jobs/jobs_operation.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/core/storage/local/hive_data_store/hive_data_store.dart';
import '../../../../core/model/user.dart';
import '../../../../core/resources/routes_manager.dart';

class EmployerHomeController extends GetxController {
  List<JobModel> jobsList = [];

  final advancedDrawerController = AdvancedDrawerController();
  var isDrawerOpen = false.obs;
  EmployerModel employerModel = EmployerModel();

  @override
  void onInit() {
    super.onInit();

    getEmployer();
    getJobs();
    advancedDrawerController.showDrawer();
  }

  getEmployer() async {
    employerModel = await EmployerDB()
        .getEmployers(HiveService().getItem(StringsManager.user).userID);
    print('current User is => $employerModel');
    update();
  }

  void getJobs() async {
    // jobModel =
    jobsList = await JobsDB()
        .getEmployerJobs(HiveService().getItem(StringsManager.user).userID);
    print('Job Model => $jobsList');
    update();
  }

  void signOut() {
    Authenticate().signOut();
    HiveService().deleteItem('user');
    HiveService().isUserLogged('isLogin', false);
    Get.toNamed(Routes.loginView);
    //delete from hive
    // HiveService().;
  }
}
