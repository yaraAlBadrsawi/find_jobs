import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduation_project/core/resources/assets_manager.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/fonts_manager.dart';
import 'package:graduation_project/core/resources/routes_manager.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/presentation/employer/employer_profile/controller/employer_profile_controller.dart';

import '../../../../core/widget/circle_image.dart';
import '../../../../core/widget/detail_box.dart';

class EmployerProfileView extends GetView<EmployerProfileController>
 {
  const EmployerProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<EmployerProfileController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: HeightManager.h30),
                      child: Row(
                        children: [
                          IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                Get.back();
                              }),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: HeightManager.h30),
                      child: Row(
                        children: [
                          IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Get.toNamed(Routes.editProfile);
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: HeightManager.h180,
                  color: ColorsManager.primary.withOpacity(0.7),
                ),
                Positioned(
                  top: HeightManager.h115,
                  right: WidthManager.w40,
                  child: Column(
                    children: [
                      Text(
                        controller.employerModel.name,
                        style: getBoldTextStyle(
                            fontSize: FontSizeManager.s22,
                            color: ColorsManager.white),
                      ),
                      Text(
                        controller.employerModel.userType,
                        style: getRegularTextStyle(
                            fontSize: FontSizeManager.s14,
                            color: ColorsManager.lightWhite),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: HeightManager.h200,
                  right: WidthManager.w60,
                  child: Text(
                    '',
                    style: getBoldTextStyle(
                        fontSize: FontSizeManager.s20,
                        color: ColorsManager.black),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    children: [
                      SizedBox(
                        height: HeightManager.h90,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: WidthManager.w15,
                        ),
                        child: Row(
                          children: [
                            CircleImage(controller.employerModel.imageUrl),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: HeightManager.h20,
            ),
            DetailsBox(
                Icons.email_outlined, controller.employerModel.email),
            SizedBox(
              height: HeightManager.h20,
            ),
            DetailsBox(
                FontAwesomeIcons.mobileScreen, controller.employerModel.phone),
            SizedBox(
              height: HeightManager.h20,
            ),
            DetailsBox(
              Icons.location_on_outlined, controller.employerModel.address),
              SizedBox(
              height: HeightManager.h20,
            ),
            DetailsBox(
              Icons.location_city_outlined,
              controller.employerModel.sizeAndIndustry,),


            SizedBox(
              height: HeightManager.h10,
            ),
            Divider(
              thickness: 0.5,
              color: ColorsManager.grey,
              indent: WidthManager.w16,
              endIndent: WidthManager.w16,
            ),
            TabBar(
              controller: controller.tabController,
              indicatorWeight: HeightManager.h2,
              indicatorColor: ColorsManager.primary,
              labelColor: ColorsManager.primary,
              tabs: const [
                Tab(text: 'About Employer'),
                Tab(text: 'Employer Achievements'),
              ],
            ),
            Expanded(
                child: TabBarView(
                  controller: controller.tabController,
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(WidthManager.w15),
                        child: Text(
                          controller.employerModel.description,
                          style: getRegularTextStyle(
                              fontSize: FontSizeManager.s14,
                              color: ColorsManager.black),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(WidthManager.w15),
                        child: Text(
                          controller.employerModel.companyAchievements,
                          style: getRegularTextStyle(
                              fontSize: FontSizeManager.s14,
                    color: ColorsManager.black),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        );
      },
    ));
  }
}



class EmployerProfileInJobSeekerView extends GetView<EmployerProfileController>
{
  const EmployerProfileInJobSeekerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<EmployerProfileController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: HeightManager.h30),
                      child: Row(
                        children: [
                          IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                Get.back();
                              }),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: HeightManager.h30),
                      child: Row(
                        children: [
                          IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Get.toNamed(Routes.editProfile);
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: HeightManager.h180,
                  color: ColorsManager.primary.withOpacity(0.7),
                ),
                Positioned(
                  top: HeightManager.h115,
                  right: WidthManager.w40,
                  child: Column(
                    children: [
                      Text(
                        controller.jobWithEmployer. employer.name,
                        style: getBoldTextStyle(
                            fontSize: FontSizeManager.s22,
                            color: ColorsManager.white),
                      ),
                      Text(
                        controller.jobWithEmployer. employer.userType,
                        style: getRegularTextStyle(
                            fontSize: FontSizeManager.s14,
                            color: ColorsManager.lightWhite),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: HeightManager.h200,
                  right: WidthManager.w60,
                  child: Text(
                    '',
                    style: getBoldTextStyle(
                        fontSize: FontSizeManager.s20,
                        color: ColorsManager.black),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    children: [
                      SizedBox(
                        height: HeightManager.h90,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: WidthManager.w15,
                        ),
                        child: Row(
                          children: [
                            CircleImage(controller.jobWithEmployer. employer.imageUrl),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: HeightManager.h20,
            ),
            DetailsBox(
                Icons.email_outlined, controller.jobWithEmployer. employer.email),
            SizedBox(
              height: HeightManager.h20,
            ),
            DetailsBox(
                FontAwesomeIcons.mobileScreen, controller.jobWithEmployer. employer.phone),
            SizedBox(
              height: HeightManager.h20,
            ),
            DetailsBox(
                Icons.location_on_outlined, controller.jobWithEmployer. employer.address),
            SizedBox(
              height: HeightManager.h20,
            ),
            DetailsBox(
              Icons.location_city_outlined,
              controller.employerModel.sizeAndIndustry,),


            SizedBox(
              height: HeightManager.h10,
            ),
            Divider(
              thickness: 0.5,
              color: ColorsManager.grey,
              indent: WidthManager.w16,
              endIndent: WidthManager.w16,
            ),
            TabBar(
              controller: controller.tabController,
              indicatorWeight: HeightManager.h2,
              indicatorColor: ColorsManager.primary,
              labelColor: ColorsManager.primary,
              tabs: const [
                Tab(text: 'About Employer'),
                Tab(text: 'Employer Achievements'),
              ],
            ),
            Expanded(
                child: TabBarView(
                  controller: controller.tabController,
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(WidthManager.w15),
                        child: Text(
                          controller.jobWithEmployer. employer.description,
                          style: getRegularTextStyle(
                              fontSize: FontSizeManager.s14,
                              color: ColorsManager.black),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(WidthManager.w15),
                        child: Text(
                          controller.jobWithEmployer. employer.companyAchievements,
                          style: getRegularTextStyle(
                              fontSize: FontSizeManager.s14,
                              color: ColorsManager.black),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        );
      },
    ));
  }
}


