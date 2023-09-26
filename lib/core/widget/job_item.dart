import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/core/widget/radius_box.dart';
import 'package:graduation_project/presentation/job_seeker/home/controller/user_home_controller.dart';

import '../model/employer/employer_model.dart';
import '../model/job.dart';
import '../network/auth/user_db.dart';
import '../resources/colors_mangaer.dart';
import '../resources/fonts_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/sizes_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../storage/local/hive_data_store/hive_data_store.dart';

class JobItem extends StatelessWidget {
  final JobModel jobsList;
  final EmployerModel employer;

  const JobItem(
    this.jobsList,
    this.employer, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.toNamed(Routes.jobDetails, arguments: jobsList);
      },
      style: TextButton.styleFrom(foregroundColor: ColorsManager.primary),
      child: Card(
          elevation: 4, // Controls the shadow depth
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                RadiusManager.r10), // Adjust the corner radius
          ),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                vertical: HeightManager.h15, horizontal: WidthManager.w15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    employer.imageUrl.isNotEmpty
                        ? Image.network(
                            employer.imageUrl,
                            width: WidthManager.w70,
                            height: HeightManager.h80,
                            fit: BoxFit.cover,
                          )
                        : const CircularProgressIndicator(
                            color: ColorsManager.primary,
                          ),
                    Padding(
                      padding: EdgeInsets.only(left: WidthManager.w20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            jobsList.jobName,
                            style: getBoldTextStyle(
                                fontSize: FontSizeManager.s22,
                                color: ColorsManager.black),
                          ),
                          Text(
                            employer.name,
                            style: getRegularTextStyle(
                                fontSize: FontSizeManager.s20,
                                color: ColorsManager.grey),
                          ),
                          SizedBox(
                            height: HeightManager.h15,
                          ),
                          Row(
                            children: [
                              RadiusBox(
                                text: jobsList.jobType,
                                color: ColorsManager.grey,
                              ),
                              SizedBox(
                                width: WidthManager.w15,
                              ),
                              RadiusBox(
                                text: jobsList.experienceYear,
                                color: ColorsManager.grey,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: HeightManager.h30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: TextSpan(
                            text: '',
                            style: getBoldTextStyle(
                                fontSize: FontSizeManager.s14,
                                color: ColorsManager.primary),
                            children: [
                          TextSpan(
                            text: jobsList.expireDate,
                            style: getRegularTextStyle(
                                fontSize: FontSizeManager.s16,
                                color: ColorsManager.black),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          )
                        ])),
                    RichText(
                        text: TextSpan(
                            text: '\$ ',
                            style: getBoldTextStyle(
                                fontSize: FontSizeManager.s16,
                                color: ColorsManager.primary),
                            children: [
                          TextSpan(
                            text: '${jobsList.jobSalary}/ monthly',
                            style: getRegularTextStyle(
                                fontSize: FontSizeManager.s14,
                                color: ColorsManager.black),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          )
                        ])),
                  ],
                )
              ],
            ),
          )),
    );
  }
}

class JobSeekerJobItem extends StatelessWidget {
  final JobWithEmployer jobWithEmployer;
  final JobWithEmployer argument;

  const JobSeekerJobItem(
    this.jobWithEmployer,
    this.argument, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.toNamed(Routes.jobDetails, arguments: argument);
      },
      style: TextButton.styleFrom(foregroundColor: ColorsManager.primary),
      child: Card(
          elevation: 4, // Controls the shadow depth
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                RadiusManager.r10), // Adjust the corner radius
          ),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                vertical: HeightManager.h15, horizontal: WidthManager.w15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    jobWithEmployer.employer.imageUrl.isNotEmpty
                        ? Image.network(
                            jobWithEmployer.employer.imageUrl,
                            width: WidthManager.w70,
                            height: HeightManager.h80,
                            fit: BoxFit.cover,
                          )
                        : const CircularProgressIndicator(
                            color: ColorsManager.primary,
                          ),
                    Padding(
                      padding: EdgeInsets.only(left: WidthManager.w20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            jobWithEmployer.job.jobName,
                            style: getBoldTextStyle(
                                fontSize: FontSizeManager.s22,
                                color: ColorsManager.black),
                          ),
                          Text(
                            jobWithEmployer.employer.name,
                            style: getRegularTextStyle(
                                fontSize: FontSizeManager.s20,
                                color: ColorsManager.grey),
                          ),
                          SizedBox(
                            height: HeightManager.h15,
                          ),
                          Row(
                            children: [
                              RadiusBox(
                                text: jobWithEmployer.job.jobType,
                                color: ColorsManager.grey1,
                              ),
                              SizedBox(
                                width: WidthManager.w15,
                              ),
                              RadiusBox(
                                text: jobWithEmployer.job.experienceYear,
                                color: ColorsManager.grey2,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: HeightManager.h30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: TextSpan(
                            text: '',
                            style: getBoldTextStyle(
                                fontSize: FontSizeManager.s14,
                                color: ColorsManager.primary),
                            children: [
                          TextSpan(
                            text: jobWithEmployer.job.expireDate,
                            style: getRegularTextStyle(
                                fontSize: FontSizeManager.s16,
                                color: ColorsManager.black),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          )
                        ])),
                    RichText(
                        text: TextSpan(
                            text: '\$ ',
                            style: getBoldTextStyle(
                                fontSize: FontSizeManager.s16,
                                color: ColorsManager.primary),
                            children: [
                          TextSpan(
                            text: '${jobWithEmployer.job.jobSalary}/ monthly',
                            style: getRegularTextStyle(
                                fontSize: FontSizeManager.s14,
                                color: ColorsManager.black),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          )
                        ])),
                  ],
                )
              ],
            ),
          )),
    );
  }
}

//
// class JobItem2 extends GetView<JobItemController> {
//   final JobModel jobsList;
//   final String employer;
//
//   final JobItemController _controller = Get.put(JobItemController());
//
//   JobItem2(
//     this.jobsList,
//     this.employer, {
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () {
//         Get.toNamed(Routes.jobDetails, arguments: jobsList);
//       },
//       style: TextButton.styleFrom(foregroundColor: ColorsManager.primary),
//       child: Card(
//           elevation: 4, // Controls the shadow depth
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(
//                 RadiusManager.r10), // Adjust the corner radius
//           ),
//           child: Container(
//             width: double.infinity,
//             padding: EdgeInsets.symmetric(
//                 vertical: HeightManager.h15, horizontal: WidthManager.w15),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     employer.imageUrl.isNotEmpty
//                         ? Image.network(
//                             employer.imageUrl,
//                             width: WidthManager.w70,
//                             height: HeightManager.h80,
//                             fit: BoxFit.cover,
//                           )
//                         : const CircularProgressIndicator(
//                             color: ColorsManager.primary,
//                           ),
//                     Padding(
//                       padding: EdgeInsets.only(left: WidthManager.w20),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             jobsList.jobName,
//                             style: getBoldTextStyle(
//                                 fontSize: FontSizeManager.s22,
//                                 color: ColorsManager.black),
//                           ),
//                           Text(
//                             employer.name,
//                             style: getRegularTextStyle(
//                                 fontSize: FontSizeManager.s20,
//                                 color: ColorsManager.grey),
//                           ),
//                           SizedBox(
//                             height: HeightManager.h15,
//                           ),
//                           Row(
//                             children: [
//                               RadiusBox(
//                                 text: jobsList.jobType,
//                                 color: ColorsManager.grey,
//                               ),
//                               SizedBox(
//                                 width: WidthManager.w15,
//                               ),
//                               RadiusBox(
//                                 text: jobsList.experienceYear,
//                                 color: ColorsManager.grey,
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: HeightManager.h30,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     RichText(
//                         text: TextSpan(
//                             text: '',
//                             style: getBoldTextStyle(
//                                 fontSize: FontSizeManager.s14,
//                                 color: ColorsManager.primary),
//                             children: [
//                           TextSpan(
//                             text: jobsList.expireDate,
//                             style: getRegularTextStyle(
//                                 fontSize: FontSizeManager.s16,
//                                 color: ColorsManager.black),
//                             recognizer: TapGestureRecognizer()..onTap = () {},
//                           )
//                         ])),
//                     RichText(
//                         text: TextSpan(
//                             text: '\$ ',
//                             style: getBoldTextStyle(
//                                 fontSize: FontSizeManager.s16,
//                                 color: ColorsManager.primary),
//                             children: [
//                           TextSpan(
//                             text: '${jobsList.jobSalary}/ monthly',
//                             style: getRegularTextStyle(
//                                 fontSize: FontSizeManager.s14,
//                                 color: ColorsManager.black),
//                             recognizer: TapGestureRecognizer()..onTap = () {},
//                           )
//                         ])),
//                   ],
//                 )
//               ],
//             ),
//           )),
//     );
//   }
// }
//
// class JobItemController extends GetxController {
//   EmployerModel employerModel = EmployerModel();
//   late String employer;
//
//   @override
//   void onInit() {
//     super.onInit();
//   }
//
//   void getEmployer() async {
//     employerModel = await EmployerDB().getEmployers(employer);
//     update();
//   }
// }
