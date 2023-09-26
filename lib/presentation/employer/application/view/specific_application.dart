import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduation_project/core/widget/job_item.dart';
import 'package:graduation_project/presentation/employer/application/controller/employer_applicatin_controller.dart';

import '../../../../core/resources/colors_mangaer.dart';
import '../../../../core/resources/sizes_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../job_seeker/jobs_in_category/view/jobs_view.dart';
import '../controller/job_controller.dart';

class JobApplicationView extends GetView<JobController> {
  const JobApplicationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, isScroll) {
              return [
                SliverAppBarWidget(),
                SliverToBoxAdapter(
                    child: Container(
                        color: ColorsManager.primary.withOpacity(0.5),
                        padding: EdgeInsets.symmetric(
                            horizontal: WidthManager.w30,
                            vertical: HeightManager.h20),
                        child: Text('Job Application',
                            style: getBoldTextStyle(
                                fontSize: IconSizeManager.s30,
                                color: ColorsManager.black)))),
              ];
            },
            body: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return JobSeekerJobItem(
                      controller.jobApplication[index],
                      controller.jobApplication[index],
                    );
                  }),
                )
              ],
            )));
  }
}
