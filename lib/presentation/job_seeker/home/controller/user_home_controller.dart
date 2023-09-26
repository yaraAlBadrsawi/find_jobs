import 'package:flutter/cupertino.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:graduation_project/config/constants.dart';
import 'package:graduation_project/core/network/auth/auth.dart';
import '../../../../core/model/employer/employer_model.dart';
import '../../../../core/model/job.dart';
import '../../../../core/model/user.dart';
import '../../../../core/network/auth/user_db.dart';
import '../../../../core/network/jobs/jobs_db.dart';
import '../../../../core/resources/colors_mangaer.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/sizes_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/storage/local/hive_data_store/hive_data_store.dart';
import '../../../../core/widget/dialog.dart';
import '../../../../core/widget/main_button.dart';
import '../../bookmarks/controller/saved_job_controller.dart';

class UserHomeController extends GetxController {
  var currentIndex = 0.obs;
  var jobsWithEmployer = [].obs;
  var recentlyJobs = [].obs;
  EmployerModel employerModel = EmployerModel();
  final advancedDrawerController = AdvancedDrawerController();
  late UserModel currentUser;
  late JobModel job;
  late EmployerModel employer;
  late bool isRecentLoading = true;
  List searchResult = [];

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
    getRecommendedJobs();
    getRecentJobs();
  }

  void getRecommendedJobs() async {
    print('current user is => ${HiveService().getItem(Constants.user).userID}');
    jobsWithEmployer.value = await JobsDB()
        .getRecommendedJobs(HiveService().getItem(Constants.user).userID);
    print('jobsWithEmployer length is => ${jobsWithEmployer.length}');
    isRecentLoading=false ;
    update();
  }


  void saveJob(value){
    SavedJobController().savedJobs.add(value);
    update();
  }


  void signOut() {
    Authenticate().signOut();
    HiveService().deleteItem('user');
    HiveService().isUserLogged('isLogin', false);
    Get.toNamed(Routes.loginView);
  }

  void getRecentJobs() async {
    recentlyJobs.value = await JobsDB().getRecentlyJobs();
    update();
  }

  void getCurrentUser() {
    currentUser = HiveService().getItem(Constants.user);
  }

  void getEmployer(String employerId) async {
    employerModel = await EmployerDB().getEmployers(employerId);
    update();
  }
}
