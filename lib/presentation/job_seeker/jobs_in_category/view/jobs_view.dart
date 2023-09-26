import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/widget/job_item.dart';
import 'package:graduation_project/presentation/job_seeker/bottom_navigation/view/job_seeker_drawer_view.dart';
import 'package:graduation_project/presentation/job_seeker/jobs_in_category/controller/jobs_controller.dart';

import '../../../../core/resources/colors_mangaer.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/sizes_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../employer/home/view/widget/sliver_app_bar.dart';

class JobsView extends GetView<JobsController> {
  const JobsView({super.key});

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
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
                        child: Text('Jobs in ${controller.categoryName}',
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
                      if (index < controller.jobsWithEmployer.length) {
                        return controller.jobsWithEmployer.isNotEmpty
                            ? JobSeekerJobItem(
                                controller.jobsWithEmployer[index],
                                controller.jobsWithEmployer[index],
                              )
                            : Center(
                                child: CircularProgressIndicator(
                                color: ColorsManager.primary,
                              ));
                      }
                    },
                    childCount: controller.jobsWithEmployer.length,
                  )))
            ]),
          ),
        ));
  }
}

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      // pinned: true,
      centerTitle: false,
      stretch: true,
      leading: Padding(
        padding: EdgeInsets.all(WidthManager.w10),
        child: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: ColorsManager.black),
        ),
      ),

      expandedHeight: 50,
      // expandedHeight: HeightManager.h200,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [StretchMode.zoomBackground],
        background: Container(
          decoration: BoxDecoration(
            color: ColorsManager.primary.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
