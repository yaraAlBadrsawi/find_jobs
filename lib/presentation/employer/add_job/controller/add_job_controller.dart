import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/config/constants.dart';
import 'package:graduation_project/core/model/employer/employer_model.dart';
import 'package:graduation_project/core/model/job.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/routes_manager.dart';
import 'package:graduation_project/core/storage/local/hive_data_store/hive_data_store.dart';
import 'package:graduation_project/core/widget/loading.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/model/user.dart';
import '../../../../core/network/auth/user_db.dart';
import '../../../../core/network/jobs/jobs_db.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../home/controller/employer_controller.dart';

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
  var jobCategory = StringsManager.jobCategory.obs;
  var educationLevels = StringsManager.educationLevel.obs;
  var formKey = GlobalKey<FormState>();

  UserModel user = HiveService().getItem(Constants.user);
  late EmployerModel _employer;

  getEmployer() async {
    EmployerModel? employerModel = await EmployerDB().getEmployers(user.userID);
    if (employerModel != null) {
      _employer = employerModel;
    }
  }

  @override
  onInit() {
    initTextEditingController();
    dateInput.text = ""; //set the initial value of text field
    // getCurrentUserData();
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
    jobs.jobId = const Uuid().v4();
    jobs.jobType = jobTypes.value;
    jobs.jobCategory = categories.value;
    jobs.jobSalary = jobSalaryController.text;
    jobs.jobDescription = jobDescriptionController.text;
    jobs.educationLevel = educationLevels.value;
    jobs.experienceYear = experienceYears.value;
    jobs.expireDate = dateInput.text;
    jobs.employerId = user.userID;
    jobs.currentTime = Timestamp.now();
    return jobs;
  }

  void addJob() async {
    LoadingDialog.show();
    if (formKey.currentState!.validate()) {
      bool isAdded = await JobsDB().addJobToDB(jobs);
      print('is Job added ?? ${isAdded}');
      if (isAdded) {
        EmployerHomeController controller = Get.find<EmployerHomeController>();
        EmployerHomeController().getJobWithEmployer(); // Update the job list after adding a job
        Get.snackbar('Job added done ', '',
            backgroundColor: ColorsManager.primary.withOpacity(0.5),
            colorText: ColorsManager.white);
        Get.toNamed(Routes.employerBottomBarView);
        LoadingDialog.hide();
        // go to home
      }
      LoadingDialog.hide();
      Get.toNamed(Routes.employerBottomBarView);
      update();
    }
    LoadingDialog.hide();
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
