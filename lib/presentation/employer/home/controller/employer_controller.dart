import 'package:flutter/cupertino.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:graduation_project/config/constants.dart';
import 'package:graduation_project/core/model/employer/employer_model.dart';
import 'package:graduation_project/core/model/job.dart';
import 'package:graduation_project/core/network/auth/auth.dart';
import 'package:graduation_project/core/network/auth/user_db.dart';
import 'package:graduation_project/core/network/jobs/jobs_db.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/core/storage/local/hive_data_store/hive_data_store.dart';
import 'package:graduation_project/core/widget/dialog.dart';
import 'package:graduation_project/core/widget/loading.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../config/theam_controller.dart';
import '../../../../core/model/user.dart';
import '../../../../core/resources/colors_mangaer.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/sizes_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/widget/main_button.dart';

class EmployerHomeController extends GetxController {
  var jobsList = [].obs;
  final advancedDrawerController = AdvancedDrawerController();
  var isDrawerOpen = false.obs;
  EmployerModel employerModel = EmployerModel();
  var jobWithEmployer = [].obs;
  RxBool on = false.obs; // our observable

  void toggle() => on.value = on.value ? false : true;

  // void toggle() {
  //   ;
  //   update();
  // }

// late  String userId;
//   UserModel user=HiveService().getItem(Constants.user);
//  late UserModel currentUser;

  @override
  void onInit() {
    super.onInit();
    advancedDrawerController.showDrawer();
    getJobWithEmployer();
    //getEmployer();
    // getJobs();
  }

  getEmployer() async {
    UserModel user = HiveService().getItem(Constants.user);
    // print('my user is => $user');
    //  currentUser = user;
    // print('current user UID  is ${currentUser.userID}');
    // employerModel = await EmployerDB().getEmployers(currentUser.userID);
    update();
  }

  // void getJobs() async {
  //   jobsList.assignAll(await JobsDB().getEmployerJobs(currentUser.userID));
  //   if (jobsList.isNotEmpty) {}
  //   update();
  // }

  void getJobWithEmployer() async {
    if (HiveService().getItem(Constants.user).userID != null) {
      jobWithEmployer.value = await JobsDB()
          .getEmployerWithJobs(HiveService().getItem(Constants.user).userID);
    }
    print('job With employer list => ${jobWithEmployer}');
    update();
  }

  void performDelete(int index) async {
    LoadingDialog.show();
    bool isDeleted = await JobsDB().deleteJob(jobWithEmployer[index].job.jobId);
    jobsList.remove(index);
    if (isDeleted) {
      Get.snackbar('Job deleted Done', '');
    } else {
      Get.snackbar('Job Not Deleted', '');
    }
    LoadingDialog.hide();
  }

  void deleteJob(index) async {
    DialogUtil.showCustomDialog(
        title: 'Are you sure you want to delete this job?',
        content: Container(
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(RadiusManager.r10))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MainButton(
                      height: HeightManager.h50,
                      width: WidthManager.w80,
                      color: ColorsManager.red,
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        StringsManager.cancel,
                        style: getRegularTextStyle(
                            fontSize: FontSizeManager.s16,
                            color: ColorsManager.white),
                      )),
                  SizedBox(
                    width: WidthManager.w20,
                  ),
                  MainButton(
                      height: HeightManager.h50,
                      width: WidthManager.w80,
                      color: ColorsManager.green,
                      onPressed: () {
                        performDelete(index);
                      },
                      child: Text(
                        StringsManager.yes,
                        style: getRegularTextStyle(
                            fontSize: FontSizeManager.s16,
                            color: ColorsManager.white),
                      )),
                ],
              )
              // text
            ],
          ),
        ),
        actionText: '');

    update();
  }

  void goToEditJob(index) {
    Get.toNamed(Routes.editJobView, arguments: jobWithEmployer[index].job);
  }

  void signOut() {
    Authenticate().signOut();
    HiveService().deleteItem(Constants.user);
    HiveService().isUserLogged('isLogin', false);
    Get.toNamed(Routes.loginView);
  }
}
