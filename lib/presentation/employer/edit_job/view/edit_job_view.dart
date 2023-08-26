import 'package:flutter/material.dart';

import '../../../../core/resources/colors_mangaer.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/sizes_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import 'job_details.dart';

class EditJobView extends StatelessWidget {
  const EditJobView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: WidthManager.w20, vertical: HeightManager.h50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        StringsManager.editJobDet,
                        style: getRegularTextStyle(
                          fontSize: FontSizeManager.s38,
                          color: ColorsManager.primary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: HeightManager.h5,
                  ),
                  Text(
                    StringsManager.addJobDes,
                    style: getTextStyle(
                        fontSize: FontSizeManager.s14,
                        color: ColorsManager.grey),
                  )
                ],
              ),
              SizedBox(
                height: HeightManager.h45,
              ),

              const EditJobsDetails(),

              //bottom
            ],
          ),
        ),
      ),
    );
  }
}
