
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DialogUtil{

String? title ;
Widget? content;
  static void showCustomDialog({required String title ,
required Widget content}){

    Get.dialog(
      AlertDialog(
        title: Text(title),
        content:content,
        actions: [
          TextButton(
            onPressed: () {

              Get.back();
            },
            child: Text('Close'),
          ),
        ],
      ),
    );

  }


}



