import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/config/constants.dart';
import 'package:graduation_project/core/model/application/application.dart';
import 'package:graduation_project/core/model/employer/employer_model.dart';
import 'package:graduation_project/core/model/job.dart';
import 'package:graduation_project/core/model/job_seeker/job_seeker_model.dart';
import 'package:graduation_project/core/model/user.dart';
import 'package:graduation_project/core/network/application/application_db.dart';
import 'package:graduation_project/core/network/auth/auth.dart';
import 'package:graduation_project/core/network/auth/user_db.dart';
import 'package:graduation_project/core/network/jobs/jobs_db.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/storage/local/hive_data_store/hive_data_store.dart';
import 'package:graduation_project/core/widget/loading.dart';
import 'package:graduation_project/core/widget/main_button.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/sizes_manager.dart';
import '../../../../core/widget/dialog.dart';
import '../../../job_seeker/application/controller/job_seeker_application_controller.dart';

class EmployerJobDetailsController extends GetxController
    with GetTickerProviderStateMixin

{
  // late JobModel jobModel;
  // late EmployerModel employer;
  bool isEmployer = false;
  late JobWithEmployer jobWithEmployer;
  late JobSeekerModel user = JobSeekerModel();
  late JobWithEmployer applicationArgument;
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this, animationDuration: const Duration(milliseconds: 850),);

    getArgument();
    applicationArgument = Get.arguments;
    print('argument => ${Get.arguments}');
  }

  getArgument() {
    print('get ARgument her ');
    if (Get.arguments != null) {
      jobWithEmployer = Get.arguments;
      if (HiveService()
          .getItem(Constants.user)
          .userType ==
          UserType.employer.name) {
        isEmployer = true;
      }
      print('ARGUMNET ==> ${Get.arguments}');
      update();
    }
  }

  ApplicationModel get application {
    ApplicationModel applicationModel = ApplicationModel();
    applicationModel.jobId = jobWithEmployer.job.jobId;
    applicationModel.applicationId = const Uuid().v4();
    applicationModel.jobSeekerId = Authenticate().getCurrentUserId();
    applicationModel.applicationStatus = false;
    applicationModel.isReview = false;
    applicationModel.applyTime = Timestamp.now();
    return applicationModel;
  }

  var applications = [].obs;

  applyToJob() async {
    user = await JobSeekerDB()
        .getJobSeeker(HiveService()
        .getItem(Constants.user)
        .userID);

    if (user.about == '') {
      DialogUtil.showCustomDialog(
        title: "you can't apply to job",
        actionText: '',
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AssetsManager.complete,
              width: WidthManager.w200,
              height: HeightManager.h200,
            ),
            SizedBox(
              height: HeightManager.h20,
            ),
            Text(
              StringsManager.cantApplyTitle,
              style: getBoldTextStyle(
                  fontSize: IconSizeManager.s20, color: ColorsManager.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: HeightManager.h10,
            ),
            Text(
              StringsManager.cantApplyDes,
              textAlign: TextAlign.center,
              style: getRegularTextStyle(
                  fontSize: IconSizeManager.s16, color: ColorsManager.grey),
            ),
            SizedBox(
              height: HeightManager.h20,
            ),
            MainButton(
                height: HeightManager.h60,
                color: ColorsManager.primary,
                onPressed: () {
                  Get.toNamed(Routes.jobSeekerInfo);
                },
                child: Text(StringsManager.completeProfile))
          ],
        ),
      );
    } else {
      LoadingDialog.show();
      print('current user id => ${Authenticate().getCurrentUserId()}');
      bool isAdded = await ApplicationDB().addApplication(application);
      print('is Added ??? ${isAdded}');
      if (isAdded) {
        Get.snackbar('application submit success','',colorText: ColorsManager.black,backgroundColor: ColorsManager.primary.withOpacity(0.5));

        JobSeekerApplicationController().jobId = application.jobId;
        applications.value = await ApplicationDB().getJobSeekerApplications(
            HiveService()
                .getItem(Constants.user)
                .userID);
        Get.snackbar(StringsManager.requrstDone, '',
            backgroundColor: ColorsManager.primary.withOpacity(.5),
            colorText: ColorsManager.white);


        for (var application in applications.value) {
          print('application in for is => ${application}');
          print('application in for is => ${application.application.isReview}');
          //  await Future.delayed(Duration.zero);
          JobSeekerApplicationController().reviewApplications.add(application);
        }
        JobSeekerApplicationController().getReviewApplication();
        Get.toNamed(Routes.jobSeekerBottomBarView);
      }
    }
    LoadingDialog.hide();
    update();
  }


  void showApplication() {
    Get.toNamed(Routes.jobApplication, arguments: applicationArgument);
  }
}
