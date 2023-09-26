import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:graduation_project/config/constants.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/fonts_manager.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/widget/job_item.dart';
import 'package:graduation_project/presentation/job_seeker/home/controller/user_home_controller.dart';
import 'package:graduation_project/presentation/job_seeker/home/view/widget/category_box.dart';
import 'package:graduation_project/presentation/job_seeker/home/view/widget/recently_jobs.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../employer/home/view/widget/sliver_app_bar.dart';
import '../../../../employer/home/view/widget/sliver_search.dart';

class JobSeekerHomeBox extends GetView<UserHomeController> {
  const JobSeekerHomeBox({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const SliverAppBarBldr(),
      SliverSearch(StringsManager.jobSeekerSubtitle),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.all(WidthManager.w10),
          child: Text(
            StringsManager.categories,
            style: getBoldTextStyle(
                fontSize: FontSizeManager.s20, color: ColorsManager.black),
          ),
        ),
      ),
      SliverGrid.builder(
          // shrinkWrap: true,
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // Number of columns in the grid
            mainAxisSpacing: 5.0, // Spacing between rows
            crossAxisSpacing: 0.0, // Spacing between columns
            mainAxisExtent: HeightManager.h70,
          ),
          itemBuilder: (context, index) {
            return CategoryBox(
              color: ColorsManager.primary.withOpacity(0.5),
              text: categories[index],
              image: categoriesImage[index],
            );
          }),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.all(WidthManager.w10),
          child: Text(
            StringsManager.recentlyJobs,
            style: getBoldTextStyle(
                fontSize: FontSizeManager.s20, color: ColorsManager.black),
          ),
        ),
      ),
      Obx(() => SliverGrid.builder(
          // shrinkWrap: true,
          itemCount: controller.recentlyJobs.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns in the grid
            mainAxisSpacing: 5.0, // Spacing between rows
            crossAxisSpacing: 5.0, // Spacing between columns
            mainAxisExtent: HeightManager.h230,
          ),
          itemBuilder: (context, index) {
            return RecentlyJobs(
              controller.recentlyJobs[index],
            );
          })),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.all(WidthManager.w10),
          child: Text(
            StringsManager.recommendedJobs,
            style: getBoldTextStyle(
                fontSize: FontSizeManager.s20, color: ColorsManager.black),
          ),
        ),
      ),
      Expanded(
        child: Obx(
          () => SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return Slidable(
              startActionPane: ActionPane(
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {

                    },
                    backgroundColor: ColorsManager.green,
                    icon: FontAwesomeIcons.pen,
                    label: StringsManager.edit,
                  )
                ],
              ),
              endActionPane: ActionPane(
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      controller.saveJob(controller.jobsWithEmployer[index]);
                    },
                    backgroundColor: ColorsManager.green,
                    icon: FontAwesomeIcons.bookmark,
                    label: StringsManager.save,
                  )
                ],
              ),
              child: JobSeekerJobItem(
          //    controller.jobsWithEmployer[index].job,
                controller.jobsWithEmployer[index],
                    controller.jobsWithEmployer[index]
                    //.employer,
              ),
            );
          }, childCount: controller.jobsWithEmployer.length)),
        ),
      ),
    ]);
  }
}

class RecommendedJobs extends GetView<UserHomeController> {
  const RecommendedJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
     return Text('');
      //    controller.recommendedJobs[index];
      //   return JobItem( controller.recommendedJobs[index],);
    });
  }
}
