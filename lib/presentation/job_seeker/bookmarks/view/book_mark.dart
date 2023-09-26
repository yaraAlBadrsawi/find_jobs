import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../core/resources/colors_mangaer.dart';
import '../../../../core/resources/sizes_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../bottom_navigation/view/job_seeker_drawer_view.dart';
import '../../jobs_in_category/view/jobs_view.dart';
import '../controller/saved_job_controller.dart';
class SavedJobView extends GetView<SavedJobController> {
  const SavedJobView({super.key});

  @override
  Widget build(BuildContext context) {
    return  AdvancedDrawer(
        drawer: JobSeekerDrawer(),
        backdrop: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [ColorsManager.primary, Colors.blueGrey.withOpacity(0.2)],
            ),
          ),
        ),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        // openScale: 1.0,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Scaffold(
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
                        child: Text('Saved jobs',
                            textAlign: TextAlign.center,
                            style: getBoldTextStyle(
                                fontSize: IconSizeManager.s30,
                                color: ColorsManager.black)))),
              ];
            },
            body: CustomScrollView(slivers: [
              Obx(() => SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      // if (index < controller.jobsWithEmployer.length) {
                      //   return JobSeekerJobItem(
                      //     controller.jobsWithEmployer[index],
                      //     controller.jobsWithEmployer[index],
                      //   );
                      // }
                      // Return an empty container or null if index is out of bounds
                     Text('saved Job => ${controller.savedJobs  [index]}');
                     print('saved Job => ${controller.savedJobs[index].job.jobName}');
                      return SizedBox.shrink();
                    },
                    childCount: controller.savedJobs.length,
                  )))
            ]),
          ),
        ));
  }
}
