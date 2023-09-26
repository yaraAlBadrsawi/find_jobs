import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../core/model/employer/employer_model.dart';
import '../../../../../core/model/job.dart';
import '../../../../../core/resources/colors_mangaer.dart';
import '../../../../../core/resources/fonts_manager.dart';
import '../../../../../core/resources/routes_manager.dart';
import '../../../../../core/resources/sizes_manager.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
class RecentlyJobs extends StatelessWidget {
  final JobWithEmployer jobWithEmployer;

  const RecentlyJobs(this.jobWithEmployer,  {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.toNamed(Routes.jobDetails, arguments: jobWithEmployer);
      },
      style: TextButton.styleFrom(foregroundColor: ColorsManager.primary),
      child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                RadiusManager.r10), // Adjust the corner radius
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, // Cross axis centering

            children: [
              SizedBox(
                height: HeightManager.h10,
              ),
              jobWithEmployer.employer.imageUrl.isNotEmpty
                  ? Image.network(
                      jobWithEmployer. employer.imageUrl,
                      width: WidthManager.w50,
                      height: HeightManager.h50,
                      fit: BoxFit.cover,
                    )
                  : const CircularProgressIndicator(
                      color: ColorsManager.primary,
                    ),
              Padding(
                padding: EdgeInsets.all(WidthManager.w5),
                child: Text(
                 jobWithEmployer.  employer.name,
                  style: getRegularTextStyle(
                      fontSize: FontSizeManager.s12, color: ColorsManager.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(WidthManager.w10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                     jobWithEmployer.  job.jobName,
                      style: getBoldTextStyle(
                          fontSize: FontSizeManager.s18,
                          color: ColorsManager.black),
                    ),
                    SizedBox(
                      height: HeightManager.h10,
                    ),
                    Text(
                      '${jobWithEmployer. job.experienceYear}  ',
                      style: getRegularTextStyle(
                          fontSize: FontSizeManager.s14,
                          color: ColorsManager.black),
                    ),
                    SizedBox(
                      height: HeightManager.h10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                         jobWithEmployer.  job.jobType,
                          style: getRegularTextStyle(
                              fontSize: FontSizeManager.s13,
                              color: ColorsManager.grey),
                        ),
                        SizedBox(
                          width: WidthManager.w15,
                        ),
                        Text(
                          '${jobWithEmployer. job.jobSalary}\$',
                          style: getRegularTextStyle(
                              fontSize: FontSizeManager.s13,
                              color: ColorsManager.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
