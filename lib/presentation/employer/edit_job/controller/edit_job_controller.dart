import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/network/jobs/jobs_db.dart';
import 'package:graduation_project/core/resources/routes_manager.dart';
import 'package:graduation_project/core/widget/loading.dart';
import 'package:intl/intl.dart';
import '../../../../core/model/job.dart';
import '../../../../core/resources/colors_mangaer.dart';
import '../../../../core/resources/strings_manager.dart';

class EditJobController extends GetxController {
  late TextEditingController jobNameController;
  late TextEditingController jobIdController;
  late TextEditingController employerIdController;
  late TextEditingController jobSalaryController;
  late TextEditingController jobDescriptionController;
  TextEditingController dateInput = TextEditingController();
  var categories = ''.obs;
  var jobTypes = ''.obs;
  var experienceYears = ''.obs;
  var educationLevels = ''.obs;
  var expireData = ''.obs;
  late JobModel jobModel;
  var formKey = GlobalKey<FormState>();

  @override
  onInit() {
    dateInput.text = ""; //set the initial value of text field
    getArgument();
    initTextEditingController();

    super.onInit();
  }

  getArgument() {
    if (Get.arguments != null) {
      jobModel = Get.arguments;
      print('ARGUMNET ==> ${Get.arguments}');
      print('JOB ID  ==> ${jobModel.jobId}');
    } else {
      LoadingDialog.show();
    }
  }

  @override
  dispose() {
    disposeTextEditingController();
    super.dispose();
  }

  JobModel get newJob {
    JobModel jobs = JobModel();
    jobs.jobName = jobNameController.text;
    jobs.jobId = jobModel.jobId;
    jobs.jobType = jobTypes.value;
    jobs.jobCategory = categories.value;
    jobs.jobSalary = jobSalaryController.text;
    jobs.jobDescription = jobDescriptionController.text;
    jobs.educationLevel = educationLevels.value;
    jobs.experienceYear = experienceYears.value;
    jobs.expireDate = dateInput.text;
    jobs.employerId = jobModel.employerId;
    jobs.currentTime = Timestamp.now();
    return jobs;
  }

  void editJob() async {
    LoadingDialog.show();
    bool isUpdate = await JobsDB().editJob(jobModel.jobId, newJob);
    if (isUpdate) {
      Get.snackbar(StringsManager.jobUpdated, StringsManager.empty,
          backgroundColor: ColorsManager.primary.withOpacity(0.5),
          colorText: ColorsManager.white);
      LoadingDialog.hide();
      Get.toNamed(Routes.employerBottomBarView);
    }
  }

  initTextEditingController() {
    jobNameController = TextEditingController(text: jobModel.jobName);
    jobIdController = TextEditingController(text: jobModel.jobId);
    employerIdController = TextEditingController(text: jobModel.employerId);

    categories.value = jobModel.jobCategory;
    jobTypes.value = jobModel.jobType;
    experienceYears.value = jobModel.experienceYear;
    educationLevels.value = jobModel.educationLevel;
    expireData.value = jobModel.expireDate;
    jobSalaryController = TextEditingController(text: jobModel.jobSalary);

    jobDescriptionController =
        TextEditingController(text: jobModel.jobDescription);
  }

  disposeTextEditingController() {
    jobNameController.dispose();
    jobIdController.dispose();
    employerIdController.dispose();
    jobSalaryController.dispose();
    jobDescriptionController.dispose();
  }

  void setCategory(String item) {
    categories.value = item;
  }

  void setExperienceYear(String item) {
    experienceYears.value = item;
  }

  void setEducationLevel(String item) {
    educationLevels.value = item;
  }

  void setJobType(String item) {
    jobTypes.value = item;
  }

  showCalender(context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,

      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: ColorsManager.primary,
            // Change header and selected date color
            textTheme: TextTheme(
              subtitle1:
                  TextStyle(color: Colors.black), // Change the text color
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print(
          formattedDate); //formatted date output using intl package =>  2021-03-16
      dateInput.text = formattedDate; //set output date to TextField value.
      update();
    } else {}
  }
}
