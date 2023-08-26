import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:graduation_project/config/constants.dart';
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

// late  String userId;
//   UserModel user=HiveService().getItem(Constants.user);
  late UserModel currentUser;

  @override
  void onInit() {
    super.onInit();
    getEmployer();
    getJobs();
    advancedDrawerController.showDrawer();
  }

  getEmployer() async {
    UserModel user = HiveService().getItem(Constants.user);
    print('my user is => $user');
    currentUser = user;
    print('current user UID  is ${user.userID}');
    employerModel = await EmployerDB().getEmployers(user.userID);
    update();
  }

  void getJobs() async {
    jobsList = await JobsDB().getEmployerJobs(currentUser.userID);
    print('Job Model => $jobsList');
    print('Current user id :  ${jobsList}');
    print('Job Model => ${jobsList[0].jobName}');
    update();
  }

  void deleteJob(index)async {
  await JobsDB().deleteJob(jobsList[index].jobId);
  }

  void goToEditJob(index){
    Get.toNamed(Routes.editJobView,arguments: jobsList[index]);

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
