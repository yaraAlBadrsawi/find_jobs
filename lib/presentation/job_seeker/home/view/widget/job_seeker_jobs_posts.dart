import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/presentation/job_seeker/home/controller/user_home_controller.dart';

import '../../../../../core/widget/job_item.dart';

class JobSeekerJobsPosts extends GetView<UserHomeController> {
  const JobSeekerJobsPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        GetBuilder<UserHomeController>(builder: (controller) {

          return SizedBox();
          // return Expanded(
          //   child: controller.recommendedJobs.isNotEmpty
          //       ? ListView.builder(
          //           itemCount: controller.jobsList.length,
          //           itemBuilder: (context, index) {
          //             controller.getEmployer(
          //               controller.jobsList[index].employerId,
          //             );
          //             return JobItem(
          //               controller.jobsList[index],
          //               controller.employerModel,
          //             );
          //           })
          //       : const Center(
          //           child: CircularProgressIndicator(
          //           backgroundColor: ColorsManager.primary,
          //         )),
          // );
        }),
      ],
    ));
  }
}
