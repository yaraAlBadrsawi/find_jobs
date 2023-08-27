import 'package:flutter/material.dart';
import 'package:graduation_project/core/resources/fonts_manager.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';

import '../../../../../core/resources/colors_mangaer.dart';

class ReviewApplication extends StatelessWidget {
  const ReviewApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            child: Row(
              children: [
                Image.network(''),
                SizedBox(
                  width: WidthManager.w15,
                ),
                Column(
                  children: [
                    Text(
                      'job name',
                      style: getBoldTextStyle(
                          fontSize: FontSizeManager.s20,
                          color: ColorsManager.black),
                    ),
                    Text(
                      'employer name ',
                      style: getRegularTextStyle(
                          fontSize: FontSizeManager.s20,
                          color: ColorsManager.grey),
                    ),
                    Text(
                      'salary',
                      style: getRegularTextStyle(
                          fontSize: FontSizeManager.s20,
                          color: ColorsManager.black),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'date',
                      style: getBoldTextStyle(
                          fontSize: FontSizeManager.s20,
                          color: ColorsManager.black),
                    ),
                    Text(
                      'in review',
                      style: getRegularTextStyle(
                          fontSize: FontSizeManager.s20,
                          color: ColorsManager.grey),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
