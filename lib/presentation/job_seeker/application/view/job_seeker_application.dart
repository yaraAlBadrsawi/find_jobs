import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduation_project/presentation/employer/application/view/emplyer_application_view.dart';
import 'package:graduation_project/presentation/job_seeker/application/view/widget/review_application.dart';

import '../../bottom_navigation/view/job_seeker_drawer_view.dart';
import '../controller/job_seeker_application_controller.dart';

class JobSeekerApplication extends GetView<JobSeekerApplicationController> {
  const JobSeekerApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ApplicationLayout(
        JobSeekerDrawer(),
        controller.reviewApplications.value,
        controller.completedApplications.value,
        JobSeekerReviewApplication(controller.reviewApplications )  )

    );
  }
}
