import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduation_project/core/resources/assets_manager.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/fonts_manager.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/storage/secure_storage/secure_storage.dart';
import 'package:graduation_project/presentation/employer/employer_profile/controller/employer_profile_controller.dart';

class EmployerProfileView extends GetView<EmployerProfileController> {
  const EmployerProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: ColorsManager.primary.withOpacity(0.3),
            //margin: EdgeInsets.all(WidthManager.w20),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(HeightManager.h50),
                  child: Text(
                    StringsManager.profile,
                    style: getMediumTextStyle(
                        fontSize: FontSizeManager.s30,
                        color: ColorsManager.primary),
                  ),
                ),
                Container(
                  width: WidthManager.w140,
                  height: HeightManager.h160,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorsManager.primary,
                      // Set the color of the frame
                      width: 3.0, // Set the width of the frame
                    ),
                    borderRadius: BorderRadius.circular(
                      (WidthManager.w140 + HeightManager.h160) /
                          2.0, // Make it a perfect circle
                    ),
                  ),
                  child: ClipOval(
                    child: Container(
                        width: WidthManager.w140,
                        height: HeightManager.h160,
                        decoration: const BoxDecoration(
                            color: ColorsManager.lightGrey,
                            shape: BoxShape.circle),
                        child: controller.employerModel.imageUrl.isNotEmpty
                            ? Image.network(
                                controller.employerModel.imageUrl,
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      color: ColorsManager.primary,
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                                },
                              )
                            : Image.asset(AssetsManager.defaultImage)),
                  ),
                ),
                SizedBox(
                  height: HeightManager.h20,
                ),
                Text(
                  controller.userModel.name,
                  style: getBoldTextStyle(
                      fontSize: FontSizeManager.s22,
                      color: ColorsManager.primary),
                ),
                SizedBox(
                  height: HeightManager.h20,
                ),
                Text(
                  controller.employerModel.phone,
                  style: getMediumTextStyle(
                      fontSize: FontSizeManager.s18,
                      color: ColorsManager.primary),
                ),
                SizedBox(
                  height: HeightManager.h20,
                ),
              ],
            ),
          ),
          SizedBox(
            height: HeightManager.h20,
          ),

          SizedBox(
            height: HeightManager.h20,
          ),
          Text(
            controller.employerModel.description,
            style: getMediumTextStyle(
                fontSize: FontSizeManager.s16, color: ColorsManager.black),
          ),

          SizedBox(
            height: HeightManager.h20,
          ),
          Text(
            controller.employerModel.companyAchievements,
            style: getMediumTextStyle(
                fontSize: FontSizeManager.s16, color: ColorsManager.black),
          ),

          SizedBox(
            height: HeightManager.h20,
          ),
          Text(
            controller.employerModel.sizeAndIndustry,
            style: getMediumTextStyle(
                fontSize: FontSizeManager.s16, color: ColorsManager.black),
          ),

          // name
          // email
          // phone number

          // image
          // address
          //  Text()
        ],
      ),
    ));
  }
}
