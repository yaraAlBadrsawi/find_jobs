import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/presentation/employer/add_job/controller/add_job_controller.dart';
import 'package:graduation_project/core/widget/main_button.dart';
import 'package:graduation_project/presentation/employer/add_job/controller/add_job_controller.dart';
import '../../../../core/resources/colors_mangaer.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/styles_manager.dart';
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(

                        icon:const Icon( Icons.arrow_back),
                        color: ColorsManager.black, onPressed: () { Get.back(); },
                      ),
                      Text(
                        StringsManager.addJob,
                        style: getBoldTextStyle(
                          fontSize: FontSizeManager.s22,
                          color: ColorsManager.primary,
                        ),
                      ),
                    SizedBox(width: WidthManager.w20,),
                    ],
                  ),

                ],
              ),
              SizedBox(
                height: HeightManager.h20,
              ),

              const JobsDetails(),

              //bottom
            ],
          ),
        ),

      appBar: AppBar(
        title: Text(
          StringsManager.addJob,
          style: getMediumTextStyle(
            fontSize: FontSizeManager.s18,
            color: ColorsManager.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: ColorsManager.white,
      ),
      body: Column(
        children: [

          MainButton(child: Text(StringsManager.addJob), width: double.infinity,
              height: HeightManager.h40, color: ColorsManager.primary, onPressed: (){
            controller.addJob();
              }),

        ],
      ),
    );
  }
}
