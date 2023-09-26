import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    isDarkMode.value? Get.changeTheme(ThemeData.dark()):Get.changeTheme(ThemeData.light());
    update();
  }

}
