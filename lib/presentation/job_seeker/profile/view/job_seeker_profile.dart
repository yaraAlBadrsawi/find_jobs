import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduation_project/core/resources/routes_manager.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/colors_mangaer.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/sizes_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/widget/circle_image.dart';
import '../../../../core/widget/detail_box.dart';
import '../controller/job_seeker_profile_controller.dart';

class JobSeekerProfileView extends GetView<JobSeekerProfileController> {
  const JobSeekerProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<JobSeekerProfileController>(
          builder:(controller){
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
                            controller.jobSeeker.name,
                            style: getBoldTextStyle(
                                fontSize: FontSizeManager.s22,
                                color: ColorsManager.white),
                          ),
                          Text(
                            controller.jobSeeker.userType,
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
                                controller.jobSeeker.imageUrl.isNotEmpty?
                                CircleImage(
                                    controller.jobSeeker.imageUrl
                                
                                ):Image.asset(AssetsManager.defaultImage)                  ,
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
                    Icons.email_outlined, controller.jobSeeker.email),
                SizedBox(
                  height: HeightManager.h20,
                ),
                DetailsBox(
                    FontAwesomeIcons.mobileScreen, controller.jobSeeker.phone),
                SizedBox(
                  height: HeightManager.h20,
                ),
                DetailsBox(
                    Icons.location_on_outlined, controller.jobSeeker.address),
                SizedBox(
                  height: HeightManager.h20,
                ),



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
                    Tab(text: 'About Job seeker'),
                    Tab(text: 'Experience'),
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
                              controller.jobSeeker.about,
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
                              controller.jobSeeker.experience,
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

          } ,

        ));
  }
}




class JobSeekerInEmployerView extends GetView<JobSeekerProfileController> {
  const JobSeekerInEmployerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<JobSeekerProfileController>(
          builder:(controller){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Padding(
                    //       padding:
                    //       EdgeInsets.symmetric(vertical: HeightManager.h30),
                    //       child:     IconButton(
                    //           icon: Icon(Icons.arrow_back),
                    //           onPressed: () {
                    //             Get.back();
                    //           }),
                    //     ),
                    //
                    //   ],
                    // ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: WidthManager.w20,vertical: HeightManager.h30),
                      child: GestureDetector(
                          child: Icon(Icons.arrow_back,size: IconSizeManager.s30,),
                          onTap: () {
print('clicked ');
                            Get.back();
                          }),
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
                            controller.application.jobSeeker.name,
                            style: getBoldTextStyle(
                                fontSize: FontSizeManager.s22,
                                color: ColorsManager.white),
                          ),
                          Text(
                            controller.application.jobSeeker.userType,
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
                                controller.application.jobSeeker.imageUrl.isNotEmpty?
                                CircleImage(
                                    controller.application.jobSeeker.imageUrl

                                ):Image.asset(AssetsManager.defaultImage)                  ,
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
                    Icons.email_outlined, controller.application. jobSeeker.email),
                SizedBox(
                  height: HeightManager.h20,
                ),
                DetailsBox(
                    FontAwesomeIcons.mobileScreen, controller.application.jobSeeker.phone),
                SizedBox(
                  height: HeightManager.h20,
                ),
                DetailsBox(
                    Icons.location_on_outlined, controller.application. jobSeeker.address),
                SizedBox(
                  height: HeightManager.h20,
                ),



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
                    Tab(text: 'About Job seeker'),
                    Tab(text: 'Experience'),
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
                              controller.application . jobSeeker.about,
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
                              controller.application . jobSeeker.experience,
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

          } ,

        ));
  }
}

