import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/model/job.dart';
import 'package:graduation_project/core/resources/assets_manager.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/fonts_manager.dart';
import 'package:graduation_project/core/resources/routes_manager.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/storage/local/hive_data_store/hive_data_store.dart';

import '../../../../../core/model/employer/employer_model.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../../../core/widget/job_item.dart';
import '../../controller/employer_controller.dart';
import 'job_title.dart';
import 'package:shimmer/shimmer.dart';

class EmployerJobsPosts extends GetView<EmployerHomeController> {
  const EmployerJobsPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmployerHomeController>(builder: (controller) {
      return SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
        return controller.jobsList.isNotEmpty
            ? Slidable(
                startActionPane: ActionPane(
                  motion: const StretchMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                     controller.goToEditJob(index);

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
                      onPressed: (context) {},
                      backgroundColor: ColorsManager.red,
                     icon: FontAwesomeIcons.trash,
                      label: StringsManager.delete,
                    )
                  ],
                ),
                // child: Shimmer.fromColors(
                //   baseColor: Colors.white,
                //   highlightColor: ColorsManager.lightGrey,
                 child:
                  JobItem(
                      controller.jobsList[index], controller.employerModel),
              //  )
        )

            : Center(
                child: SvgPicture.asset(
                  AssetsManager.noData,
                  height: HeightManager.h300,
                  width: WidthManager.w300,
                ),
              );
      }, childCount: controller.jobsList.length));
    });
  }
}

//
// return Expanded(
// child: Column(
// children: [
// GetBuilder<EmployerHomeController>(builder: (controller) {
// return Expanded(
// child: ListView.builder(
// itemCount: controller.jobsList.length,
// itemBuilder: (context, index) {
// print('item length => ${controller.jobsList.length}');
// return JobItem(
// controller.jobsList[index], controller.employerModel);
// }),
// );
// }),
// ],
// ));
