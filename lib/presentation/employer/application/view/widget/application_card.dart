import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:graduation_project/config/constants.dart';
import 'package:graduation_project/core/model/application/application_details.dart';
import 'package:graduation_project/core/resources/fonts_manager.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/storage/local/hive_data_store/hive_data_store.dart';
import 'package:graduation_project/presentation/employer/application/controller/employer_applicatin_controller.dart';
import 'package:graduation_project/presentation/job_seeker/application/controller/job_seeker_application_controller.dart';
import 'package:intl/intl.dart';
import '../../../../../core/model/user.dart';
import '../../../../../core/resources/colors_mangaer.dart';
import '../../../../../core/resources/routes_manager.dart';

class EmployerReviewApplication extends GetView<EmployerApplicationController> {
  // final List<dynamic> application;

  const EmployerReviewApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
          itemBuilder: (context, index) {
            return Slidable(
                startActionPane: ActionPane(
                  motion: const StretchMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        // print(
                        //     'item is passed=> ${controller.reviewApplications[index].application.isReivew}');
                        print('accept');
                        controller.applicationStatue.value=true;

                        controller.getCompletedApplication(
                            controller.reviewApplications[index]);

                      },
                      backgroundColor: ColorsManager.green,
                      icon: FontAwesomeIcons.check,
                      label: StringsManager.accept,
                    )
                  ],
                ),
                endActionPane: ActionPane(
                  motion: const StretchMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        controller.applicationStatue.value=false;
                        controller.getCompletedApplication(
                            controller.reviewApplications[index]);
                      },
                      backgroundColor: ColorsManager.red,
                      icon: FontAwesomeIcons.xmark,
                      label: StringsManager.unacceptable,
                    ),
                  ],
                ),
                child: ApplicationCard(controller.reviewApplications[index]));
          },
          itemCount: controller.reviewApplications.length,
        ));
  }
}

class CompletedApplication extends StatelessWidget {
  final List<dynamic> application;

  const CompletedApplication(this.application, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ApplicationCard(application[index],color:
        application[index].application.applicationStatus?
        ColorsManager.red:ColorsManager.green,
            );
      },
      itemCount: application.length,
    );
  }
}

class ApplicationCard extends StatelessWidget {
  const ApplicationCard(this.application, {super.key,this.color=ColorsManager.yellow});
  final Application application;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  //  Get.toNamed(routeName);
                },
                style: TextButton.styleFrom(
                    foregroundColor: ColorsManager.primary,
                    padding: EdgeInsets.zero),
                child: TextButton(
                  onPressed: (){
                    Get.toNamed(Routes.jobSeekerInEmployer,arguments: application);
                  },
                  child: Image.network(
                    HiveService().getItem(Constants.user).userType ==
                            UserType.employer.name
                        ? application.jobSeeker.imageUrl
                        : application.employer.imageUrl,
                    width: WidthManager.w60,
                    height: HeightManager.h60,
                  ),
                ),
              ),
              // Text(' employer '),
              Column(
                children: [
                  SizedBox(height: HeightManager.h10,),

                  Text(
                    application.job.jobName,

                    style: getBoldTextStyle(

                        fontSize: FontSizeManager.s16,
                        color: ColorsManager.black),
                  ),

                  Text(
                    application.employer.name,
                    style: getRegularTextStyle(
                        fontSize: FontSizeManager.s14,
                        color: ColorsManager.grey),
                  ),
                  SizedBox(height: HeightManager.h20,),

                  Text(
                    'salary \$ ${application.job.jobSalary} /month',
                    style: getRegularTextStyle(
                        fontSize: FontSizeManager.s12,
                        color: ColorsManager.black),
                  ),
                ],
              ),

              Column(
                children: [
                  SizedBox(height: HeightManager.h20,),

                  Text(
                    DateFormat('yyyy-MM-dd')
                        .format(application.application.applyTime!.toDate()),
                    style: getBoldTextStyle(
                        fontSize: FontSizeManager.s12,
                        color: ColorsManager.black),
                  ),
                  SizedBox(height: HeightManager.h20,),
                  Container(
                    padding: EdgeInsets.all(WidthManager.w8),
                    decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(RadiusManager.r15)),
                    child: Text(
                     color==ColorsManager.yellow?
                     StringsManager.inReview:'completed',
                      style: getRegularTextStyle(
                          fontSize: FontSizeManager.s14,
                          color: color==ColorsManager.yellow?ColorsManager.grey:ColorsManager.white),
                    ),
                  ),
                  SizedBox(height: HeightManager.h10,),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [],
              ),
            ],
          ),
        )
      ],
    );
  }
}

// class ShowProfile extends StatelessWidget {
//   const ShowProfile({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: ,);
//   }
// }
