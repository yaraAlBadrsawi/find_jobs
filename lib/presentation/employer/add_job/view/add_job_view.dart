import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/presentation/employer/add_job/controller/add_job_controller.dart';
import '../../../../core/resources/colors_mangaer.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/validator/validator.dart';
import '../../../../core/widget/text_field.dart';
import '../../../auth/widget/popup.dart';
import 'add_job_details.dart';

class AddJobView extends GetView<AddJobController> {
  const AddJobView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: WidthManager.w20, vertical: HeightManager.h50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        StringsManager.addJob,
                        style: getRegularTextStyle(
                          fontSize: FontSizeManager.s38,
                          color: ColorsManager.primary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: HeightManager.h5,
                  ),
                  Text(
                    StringsManager.addJobDes,
                    style: getTextStyle(
                        fontSize: FontSizeManager.s14,
                        color: ColorsManager.grey),
                  )
                ],
              ),
              SizedBox(
                height: HeightManager.h45,
              ),

              const JobsDetails(),

              //bottom
            ],
          ),
        ),
      ),
    );
  }
}
