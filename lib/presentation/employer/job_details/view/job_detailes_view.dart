import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/widget/main_button.dart';
import 'package:graduation_project/presentation/employer/job_details/controller/binding/job_details_binding.dart';
import 'package:graduation_project/presentation/job_seeker/home/controller/user_home_controller.dart';

import '../controller/job_details_controller.dart';

class JobDetailsView extends GetView<JobDetailsController> {
  const JobDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Center(
          child: MainButton(child:   Text('Apply To Job Now'), height: HeightManager.h40,
              color: ColorsManager.primary, onPressed: (){
            controller.applyToJob();
              } ),
        )

        // logo
        // company name
        //
      ],),
    );
  }
}
