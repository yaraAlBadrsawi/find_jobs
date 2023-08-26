import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/widget/main_button.dart';
import 'package:graduation_project/core/widget/radius_box.dart';
import 'package:graduation_project/presentation/employer/job_details/controller/employer_job_details_controller.dart';

import '../../../../core/resources/fonts_manager.dart';

class EmployerJobDetailsView extends GetView<EmployerJobDetailsController> {
  const EmployerJobDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                padding: EdgeInsets.symmetric(horizontal: HeightManager.h20,vertical: HeightManager.h50),
                    width: double.infinity,
                    color: ColorsManager.white,
                    child: ClipOval(
                      child: Image.network(
                        controller.employer.imageUrl,
                        width: WidthManager.w200,
                        height: HeightManager.h200,
                      ),
                    ),
                  ),

                  Text(
                    controller.jobModel.jobName,
                    style: getBoldTextStyle(
                        fontSize: FontSizeManager.s30,
                        color: ColorsManager.black),
                  ),

                  Text(
                    controller.employer.name,
                    style: getRegularTextStyle(
                        fontSize: FontSizeManager.s18,
                        color: ColorsManager.grey),
                  ),
                  SizedBox(
                    height: HeightManager.h20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RadiusBox(
                          text: controller.jobModel.jobType,
                          color: ColorsManager.primary.withOpacity(0.5)),
                      SizedBox(
                        width: WidthManager.w10,
                      ),
                      RadiusBox(
                          text: controller.jobModel.experienceYear,
                          color: ColorsManager.primary.withOpacity(0.5)),
                      SizedBox(
                        width: WidthManager.w10,
                      ),
                      RadiusBox(
                          text: controller.jobModel.jobCategory,
                          color: ColorsManager.primary.withOpacity(0.5)),
                    ],
                  ),

                  SizedBox(
                    height: HeightManager.h20,
                  ),
                  RichText(
                      text: TextSpan(
                          text: '\$ ',
                          style: getBoldTextStyle(
                              fontSize: FontSizeManager.s20,
                              color: ColorsManager.primary),
                          children: [
                        TextSpan(
                          text: '${controller.jobModel.jobSalary}',
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
                      ])),
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
                    child: Text(
                      controller.jobModel.jobDescription,
                      style: getRegularTextStyle(
                          fontSize: FontSizeManager.s16,
                          color: ColorsManager.black),
                    ),
                  ),

                  SizedBox(
                    height: HeightManager.h10,
                  ),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: WidthManager.w10),
                      child:
                      RichText(
                          text: TextSpan(
                              text: ' 🔹 Expire Date :',
                              style: getBoldTextStyle(
                                  fontSize: FontSizeManager.s16,
                                  color: ColorsManager.black),
                              children: [
                                TextSpan(
                                  text: controller.jobModel.expireDate,
                                  style: getRegularTextStyle(
                                      fontSize: FontSizeManager.s18,
                                      color: ColorsManager.primary),
                                  recognizer: TapGestureRecognizer()..onTap = () {},
                                ),

                              ])),

                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: WidthManager.w10),
                      child:
                      RichText(
                          text: TextSpan(
                              text: '🔹 education requirement : ',
                              style: getBoldTextStyle(
                                  fontSize: FontSizeManager.s16,
                                  color: ColorsManager.black),
                              children: [
                                TextSpan(
                                  text: controller.jobModel.educationLevel,
                                  style: getRegularTextStyle(
                                      fontSize: FontSizeManager.s18,
                                      color: ColorsManager.primary),
                                  recognizer: TapGestureRecognizer()..onTap = () {},
                                ),

                              ])),


                    ),
                  ),

                  // logo
                  // company name
                  //
                ],
              ),
            ),
          ),
          MainButton(
              horizontalMargin: WidthManager.w10,
              child: Text(
                'Apply To Job Now',
                style: getRegularTextStyle(
                    fontSize: FontSizeManager.s18, color: ColorsManager.white),
              ),
              height: HeightManager.h50,
              width: double.infinity,
              color: ColorsManager.primary,
              onPressed: () {
                controller.applyToJob();
              })
        ],
      ),
    );
  }
}
