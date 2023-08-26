import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:graduation_project/config/constants.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/fonts_manager.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/widget/main_button.dart';
import 'package:graduation_project/presentation/job_seeker/interest/controller/interest_controller.dart';
import 'package:hive/hive.dart';

class InterestView extends GetView<InterestController> {
  const InterestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primary,
      body: Column(
        children: [
          SizedBox(
            height: HeightManager.h100,
          ),
          Text(
            StringsManager.interest,
            style: getRegularTextStyle(
                fontSize: FontSizeManager.s20, color: ColorsManager.white),
          ),
          SizedBox(
            height: HeightManager.h20,
          ),
          Text(
            StringsManager.interestDes,
            style: getRegularTextStyle(
                fontSize: FontSizeManager.s18, color: ColorsManager.white),
          ),
          Padding(
            padding: EdgeInsets.all(WidthManager.w20),
            child: Text(
              StringsManager.interestCat,
              style: getMediumTextStyle(
                  fontSize: FontSizeManager.s14,
                  color: ColorsManager.lightWhite),
            ),
          ),
          SizedBox(
            height: HeightManager.h20,
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: HeightManager.h30, horizontal: HeightManager.h10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorsManager.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(RadiusManager.r50),
                      topRight: Radius.circular(RadiusManager.r50)),
                ),
                child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Container(
                          height: HeightManager.h60,
                          padding: EdgeInsets.all(WidthManager.w20),
                          margin: EdgeInsets.all(WidthManager.w8),
                          decoration: BoxDecoration(
                            color: ColorsManager.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(RadiusManager.r20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                SizedBox(
                                  width: WidthManager.w5,
                                ),
                                Text(
                                  categories[index],
                                  style: getRegularTextStyle(
                                      fontSize: FontSizeManager.s16,
                                      color: ColorsManager.black),
                                ),
                              ]),
                              Obx(
                                () => Checkbox(
                                  value: controller.isCheckedList[index],
                                  onChanged: (val) {

                                    // print();
                                    // controller.isCheckedList[index] =
                                    // !controller.isCheckedList[index];

                                   controller.toggle(index);
                                    print('item ${controller.isCheckedList[index]} isChecked ');
                                  },
                                  activeColor: ColorsManager.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      RadiusManager.r20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ));
                    })),
          ),
          MainButton(
              child: Text(StringsManager.continues),
              height: HeightManager.h40,
              color: ColorsManager.primary,
              onPressed: () {
                // final checkedValues = List<int>.generate(
                //   controller.isCheckedList.length,
                //   (index) => controller.isCheckedList[index] ? index : -1,
                // ).where((value) => value >= 0).toList();

                // final selectedCategories = <String>[];

                for (int index = 0;
                    index < controller.isCheckedList.length;
                    index++) {
                  if (controller.isCheckedList[index]) {
                    controller.selectedInterest.add(categories[index]);
                    print('item => ${categories[index]} is added to list done');
                  }
                }
                print('interest select is : ${controller.selectedInterest}');
                controller.storeInterest(controller.selectedInterest.value);
              })
        ],
      ),
      /**
          Column(
          children: [
          SizedBox(
          height: HeightManager.h100,
          ),
          Text(
          StringsManager.interest,
          style: getRegularTextStyle(
          fontSize: FontSizeManager.s20, color: ColorsManager.white),
          ),
          SizedBox(
          height: HeightManager.h20,
          ),
          Text(
          StringsManager.interestDes,
          style: getRegularTextStyle(
          fontSize: FontSizeManager.s18, color: ColorsManager.white),
          ),
          Padding(
          padding: EdgeInsets.all(WidthManager.w20),
          child: Text(
          StringsManager.interestCat,
          style: getMediumTextStyle(
          fontSize: FontSizeManager.s14, color: ColorsManager.lightWhite),
          ),
          ),
          SizedBox(
          height: HeightManager.h20,
          ),
          Expanded(
          child: Container(
          padding: EdgeInsets.symmetric(
          vertical: HeightManager.h30, horizontal: HeightManager.h10),
          width: double.infinity,
          decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(RadiusManager.r50),
          topRight: Radius.circular(RadiusManager.r50)),
          ),
          child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
          return Container(
          height: HeightManager.h60,
          padding: EdgeInsets.all(WidthManager.w20),
          margin: EdgeInsets.all(WidthManager.w8),
          decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.all(
          Radius.circular(RadiusManager.r20)),
          boxShadow: [
          BoxShadow(
          color: Colors.black.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),
          ),
          ],
          ),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Row(children: [
          SizedBox(
          width: WidthManager.w5,
          ),
          Text(
          categories[index],
          style: getRegularTextStyle(
          fontSize: FontSizeManager.s16,
          color: ColorsManager.black),
          ),
          ]),
          Obx(
          () => Checkbox(
          value: controller.isCheckedList[index],
          onChanged: (val) {
          controller.isCheckedList[index] =
          val ?? false;

          controller.toggle();
          },
          activeColor: ColorsManager.primary,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
          RadiusManager.r20,
          ),
          ),
          ),
          ),
          ],
          ));
          })),
          ),
          MainButton(child: Text(StringsManager.continues), height: HeightManager.h40,
          color:ColorsManager.primary, onPressed: (){
          final checkedValues = List<int>.generate(
          controller.isCheckedList.length,
          (index) => controller.isCheckedList[index] ? index : -1,
          ).where((value) => value >= 0).toList();
          })

          ],
          ),


       **/
    );
  }
}
