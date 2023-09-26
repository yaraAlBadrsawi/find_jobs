import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/routes_manager.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/widget/circle_image.dart';
import 'package:graduation_project/core/widget/main_button.dart';
import 'package:graduation_project/core/widget/radius_box.dart';
import 'package:graduation_project/presentation/employer/job_details/controller/employer_job_details_controller.dart';

import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/widget/detail_box.dart';

class EmployerJobDetailsView extends GetView<EmployerJobDetailsController> {
  const EmployerJobDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          color: ColorsManager.black,
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        Text(
                          StringsManager.jobDetails,
                          style: getBoldTextStyle(
                            fontSize: FontSizeManager.s22,
                            color: ColorsManager.black,
                          ),
                        ),
                        SizedBox(
                          width: WidthManager.w80,
                        ),
                      ],
                    ),
                    TextButton(
                     onPressed: (){
                       Get.toNamed(Routes.employerInJobSeeker,arguments:controller.jobWithEmployer);
                     },
                      child: CircleImage(
                        controller.jobWithEmployer.employer.imageUrl,
                        size: 100,
                      ),
                    ),
                    SizedBox(
                      height: HeightManager.h10,
                    ),
                    GetBuilder<EmployerJobDetailsController>(
                        builder: (controller) {
                      return Text(
                        controller.jobWithEmployer.job.jobName,
                        style: getBoldTextStyle(
                            fontSize: FontSizeManager.s30,
                            color: ColorsManager.black),
                      );
                    }),
                    GetBuilder<EmployerJobDetailsController>(
                        builder: (controller) {
                      return Text(
                        controller.jobWithEmployer.employer.name,
                        style: getRegularTextStyle(
                            fontSize: FontSizeManager.s18,
                            color: ColorsManager.grey),
                      );
                    }),
                    SizedBox(
                      height: HeightManager.h20,
                    ),
                    GetBuilder<EmployerJobDetailsController>(
                        builder: (controller) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RadiusBox(
                              text: controller.jobWithEmployer.job.jobType,
                              color: ColorsManager.primary.withOpacity(0.5)),
                          SizedBox(
                            width: WidthManager.w10,
                          ),
                          RadiusBox(
                              text:
                                  controller.jobWithEmployer.job.experienceYear,
                              color: ColorsManager.primary.withOpacity(0.5)),
                          SizedBox(
                            width: WidthManager.w10,
                          ),
                          RadiusBox(
                              text: controller.jobWithEmployer.job.jobCategory,
                              color: ColorsManager.primary.withOpacity(0.5)),
                        ],
                      );
                    }),

                    SizedBox(
                      height: HeightManager.h20,
                    ),
                    GetBuilder<EmployerJobDetailsController>(
                        builder: (controller) {
                      return RichText(
                          text: TextSpan(
                              text: '\$ ',
                              style: getBoldTextStyle(
                                  fontSize: FontSizeManager.s20,
                                  color: ColorsManager.primary),
                              children: [
                            TextSpan(
                              text: controller.jobWithEmployer.job.jobSalary,
                              style: getBoldTextStyle(
                                  fontSize: FontSizeManager.s20,
                                  color: ColorsManager.primary),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                            TextSpan(
                              text: '/ monthly',
                              style: getRegularTextStyle(
                                  fontSize: FontSizeManager.s20,
                                  color: ColorsManager.black),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                          ]));
                    }),
                    SizedBox(
                      height: HeightManager.h20,
                    ),
                    DetailsBox(Icons.date_range,
                        controller.jobWithEmployer.job.expireDate),
                    DetailsBox(
                      Icons.remove_from_queue_outlined,
                      'this job require : ${controller.jobWithEmployer.job.educationLevel}',
                    ),
                    SizedBox(
                      height: HeightManager.h20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: WidthManager.w20,
                            vertical: HeightManager.h5),
                        child: Text(
                          StringsManager.jobDescription,
                          style: getBoldTextStyle(
                              fontSize: FontSizeManager.s18,
                              color: ColorsManager.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: WidthManager.w20),
                      child: GetBuilder<EmployerJobDetailsController>(
                          builder: (controller) {
                        return Text(
                          controller.jobWithEmployer.job.jobDescription,
                          style: getRegularTextStyle(
                              fontSize: FontSizeManager.s16,
                              color: ColorsManager.black),
                        );
                      }),
                    ),

                    SizedBox(
                      height: HeightManager.h10,
                    ),

                    // logo
                    // company name
                    //
                  ],
                ),
              ),
            ),
            GetBuilder<EmployerJobDetailsController>(builder: (controller) {
              return MainButton(
                  horizontalMargin: WidthManager.w10,
                  height: HeightManager.h50,
                  width: double.infinity,
                  color: ColorsManager.primary,
                  onPressed: () {
                    controller.isEmployer
                        ? controller.showApplication()
                        : controller.applyToJob();
                  },
                  child: Text(
                    controller.isEmployer
                        ? StringsManager.showApplication
                        : StringsManager.applyNow,
                    style: getRegularTextStyle(
                        fontSize: FontSizeManager.s18,
                        color: ColorsManager.white),
                  ));
            })
          ],
        ),
      ),
    );
  }
}
