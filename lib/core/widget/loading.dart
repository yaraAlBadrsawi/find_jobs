import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';

class LoadingDialog {
  static void show() {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(
          color: ColorsManager.primary,
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void hide() {
    Get.back();
  }
}

//}