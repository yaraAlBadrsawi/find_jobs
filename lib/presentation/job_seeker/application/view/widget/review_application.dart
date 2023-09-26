import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../../employer/application/view/widget/application_card.dart';
import '../../controller/job_seeker_application_controller.dart';
class JobSeekerReviewApplication extends GetView<JobSeekerApplicationController> {

  final List<dynamic> application;

  const JobSeekerReviewApplication(this.application, {super.key});

  @override
  Widget build(BuildContext context) {
    return
      Obx(() =>  ListView.builder(
        itemBuilder: (context, index) {
          return ApplicationCard(application[index]);
        },
        itemCount: application.length,
      ));
  }
}
