import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/fonts_manager.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/storage/local/hive_data_store/hive_data_store.dart';
import 'package:graduation_project/core/storage/secure_storage/secure_storage.dart';
import 'package:graduation_project/presentation/employer/employer_profile/controller/employer_profile_controller.dart';


class EmployerProfileView extends GetView<EmployerProfileController> {
  const EmployerProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  'profile page ',
                  style: getMediumTextStyle(
                      fontSize: FontSizeManager.s18, color: ColorsManager.primary),
                ),
              ),


              Container(
                width: WidthManager.w140,
                height: HeightManager.h160,
                decoration: BoxDecoration(
                    color: ColorsManager.lightGrey, shape: BoxShape.circle),
              child:controller.employerModel!.imageUrl.isNotEmpty ? Image.network(controller.employerModel!.imageUrl) : const SizedBox()
              ),



              Text(
                controller.userModel.email,
                style: getMediumTextStyle(
                    fontSize: FontSizeManager.s16, color: ColorsManager.black),
              ),
              Text(
                controller.userModel.name,
                style: getMediumTextStyle(
                    fontSize: FontSizeManager.s16, color: ColorsManager.black),
              ),

          // Text(
          //   '${controller.userModel.phoneNumber} ',
          //   style: getMediumTextStyle(
          //       fontSize: FontSizeManager.s20, color: ColorsManager.black),
          // ),
              Text(
                '${SecureStorage().readSecureStorage(StringsManager.phone)}}',
                style: getMediumTextStyle(
                    fontSize: FontSizeManager.s16, color: ColorsManager.black),
              ),


              Text(
                controller.employerModel.description,
                style: getMediumTextStyle(
                    fontSize: FontSizeManager.s16, color: ColorsManager.black),
              ),

              Text(
                controller.employerModel.companyAchievements,
                style: getMediumTextStyle(
                    fontSize: FontSizeManager.s16, color: ColorsManager.black),
              ),
              Text('address '),

              Text('others '),
              // name
              // email
              // phone number

              // image
              // address
              //  Text()
        ],
      )
         ),
    );
  }
}
