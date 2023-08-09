import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/config/constants.dart';
import 'package:graduation_project/core/model/job.dart';
import 'package:intl/intl.dart';

import '../../../../core/network/auth/jobs/jobs_operation.dart';
import '../../../../core/resources/strings_manager.dart';

class AddJobController extends GetxController {
  late TextEditingController jobNameController;
  late TextEditingController jobIdController;
  late TextEditingController employerIdController;
  late TextEditingController jobCategoryController;
  late TextEditingController jobTypeController;
  late TextEditingController jobSalaryController;
  late TextEditingController expireDateController;
  late TextEditingController educationLevelController;
  late TextEditingController experienceYearController;
  late TextEditingController responsibilitiesController;
  late TextEditingController jobDescriptionController;
  TextEditingController dateInput = TextEditingController();

  var categories = StringsManager.jobCategory.obs;
  var jobTypes = StringsManager.jobType.obs;
  var experienceYears = StringsManager.experienceYear.obs;
  var educationLevels = StringsManager.educationLevel.obs;
  var formKey = GlobalKey<FormState>();


  @override
  onInit() {
    initTextEditingController();
    dateInput.text = ""; //set the initial value of text field

    super.onInit();
  }

  @override
  dispose() {
    disposeTextEditingController();
    super.dispose();
  }

  JobModel get jobs {
    JobModel jobs = JobModel();
    jobs.jobName = jobNameController.text;
    jobs.jobType = jobTypes.value;
    jobs.jobCategory = categories.value;
    jobs.jobSalary = jobSalaryController.text;
    jobs.jobDescription = jobDescriptionController.text;
    jobs.educationLevel = educationLevels.value;
    jobs.experienceYear = experienceYears.value;
    jobs.expireDate = dateInput.text;
    return jobs;
  }

  addJob() async {
  if(formKey.currentState!.validate()){
    bool isAdded = await JobsInsert().addJobToDB(jobs);

    if (isAdded) {
      Get.snackbar('Job added done ', '');
      // go to home

    }
    }
  }

  initTextEditingController() {
    jobNameController = TextEditingController();
    jobIdController = TextEditingController();
    employerIdController = TextEditingController();
    jobCategoryController = TextEditingController();
    jobTypeController = TextEditingController();
    jobSalaryController = TextEditingController();
    expireDateController = TextEditingController();
    educationLevelController = TextEditingController();
    experienceYearController = TextEditingController();
    responsibilitiesController = TextEditingController();
    jobDescriptionController = TextEditingController();
  }

  disposeTextEditingController() {
    jobNameController.dispose();
    jobIdController.dispose();
    employerIdController.dispose();
    jobCategoryController.dispose();
    jobTypeController.dispose();
    jobSalaryController.dispose();
    expireDateController.dispose();
    educationLevelController.dispose();
    experienceYearController.dispose();
    responsibilitiesController.dispose();
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
        lastDate: DateTime(2100));

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
