import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduation_project/presentation/employer/add_job/controller/add_job_controller.dart';

import '../../../../config/constants.dart';
import '../../../../core/resources/colors_mangaer.dart';
import '../../../../core/resources/sizes_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/validator/validator.dart';
import '../../../../core/widget/main_button.dart';
import '../../../../core/widget/text_field.dart';
import '../../../auth/widget/popup.dart';

class JobsDetails extends GetView<AddJobController> {
  const JobsDetails({super.key});


  @override
  Widget build(BuildContext context) {
    return Form(
      key:controller.formKey,
        child: Column(
      children: [
        // job name
        AppTextFields(
          hint: StringsManager.jobName.tr,
          controller: controller.jobNameController,
          keyboardType: TextInputType.text,
          validator: (value) {
            return FieldValidator.validateData(value);
          },
        ),
        // job category

        SizedBox(height: HeightManager.h20,),
        Obx(
          () => AppTextFields(
            readOnly: true,
            hint: controller.categories.value,
            suffixIcon: PopUpMenu(
                list: categories,
                // txt: StringsManager.categories,
                onSelect: ((String item) {
                  print('Selected category: $item');
                  controller.setCategory(item);
                })),
          ),
        ),
        SizedBox(height: HeightManager.h20,),

        // job type
        Obx(
          () => AppTextFields(
            readOnly: true,
            hint: controller.jobTypes.value,
            suffixIcon: PopUpMenu(
                list: jobsType,
                // txt: StringsManager.categories,
                onSelect: ((String item) {
                  print('Selected jobTypes: $item');
                  controller.setJobType(item);
                })),
          ),
        ),
        //jobSalary
        SizedBox(height: HeightManager.h20,),

        AppTextFields(
          hint: StringsManager.jobSalary.tr,
          controller: controller.jobSalaryController,
          keyboardType: TextInputType.number,
          suffixIcon: const Icon(
            Icons.attach_money,
            color: ColorsManager.primary,
          ),
          validator: (value) {
            return FieldValidator.validateData(value);
          },
        ),
        //expireDate
        SizedBox(height: HeightManager.h20,),

        AppTextFields(
          readOnly: true,
          hint: StringsManager.expireDate.tr,
          controller: controller.dateInput,
          keyboardType: TextInputType.datetime,
          onTap: (){
            controller.showCalender(context);
          },
          validator: (value) {
            return FieldValidator.validateData(value);
          },
        ),
        //educationLevel
        SizedBox(height: HeightManager.h20,),

        Obx(
          () => AppTextFields(
            readOnly: true,
            hint: controller.educationLevels.value,
            suffixIcon: PopUpMenu(
                list: educationLevel,
                onSelect: ((item) {
                  print('value was selected is $item');
                  controller.setEducationLevel(item);
                })),
          ),
        ),
        SizedBox(height: HeightManager.h20,),

        Obx(
          () => AppTextFields(
            readOnly: true,
            hint: controller.experienceYears.value,
            suffixIcon: PopUpMenu(
                list: yearsOfExperience,
                onSelect: ((item) {
                  controller.setExperienceYear(item);
                })),
          ),
        ),
        SizedBox(height: HeightManager.h20,),
        AppTextFields(
          hint: StringsManager.jobDescription.tr,
          controller: controller.jobDescriptionController,
          keyboardType: TextInputType.text,
          length: 150,
          isConstraints: true,
          maxLines: 8,

          validator: (value) {
            return FieldValidator.validateData(value);
          },
        ),
        SizedBox(height:HeightManager.h20),
        MainButton(
          width: double.infinity,
          height: HeightManager.h50,
          color: ColorsManager.primary,
          onPressed: () {
            controller.addJob();
          },
          child: Text(StringsManager.addJob),
        ),
      ],
    ));
  }
}
