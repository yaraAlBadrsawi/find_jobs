import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:hive/hive.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../widget/headers.dart';
import '../../widget/register_details.dart';
import '../controller/register_controller.dart';

class RegisterBody extends GetView<RegisterController> {
  // late RegisterController controller;
  final List<String> heads = [
    StringsManager.user,
    StringsManager.employer,
    // StringsManager.userAndEmployer,
  ];

  RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < heads.length; i++)
                Obx(() =>
                    GestureDetector(
                      onTap: () {
                        controller.changeCurrent(i);
                        print('Selected index => ${controller.current}');
                      },
                      child: choose(heads[i], i),
                    )),
            ],
          ),



          Container(
            padding: EdgeInsets.symmetric(
              vertical: HeightManager.h30, horizontal: HeightManager.h24),
            width: double.infinity,

            child:const Details(),


          )

        ],
      ),
    );
  }

  Widget choose(String head, int index) {
    // final prov = controller;
    if (controller.current == index) {
      return Header(head: head);
    } else {
      return Header(head: head, isSelect: false);
    }
  }
}
