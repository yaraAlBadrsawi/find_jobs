import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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

  @override
  onInit() {
    initTextEditingController();
    super.onInit();
  }

  @override
  dispose() {
    disposeTextEditingController();
    super.dispose();
  }

  addJob() {}

  initTextEditingController() {
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
}
