
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/util/size_util.dart';

class DialogUtil{

String? title ;
String? actionText;
Widget? content;

  static void showCustomDialog({required String title ,
required Widget content,required String actionText}


){

    Get.dialog(
      barrierDismissible:true ,
      AlertDialog(
        title:
        Text(title,
          textAlign: TextAlign.center,
          style: getMediumTextStyle(fontSize: AppSize.s18, color: ColorsManager.primary),),

        content:content,
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            }, child: Text(''),
          ),
        ],
      ),
    );

  }


}



