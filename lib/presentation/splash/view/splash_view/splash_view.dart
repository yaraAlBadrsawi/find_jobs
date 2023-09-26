import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/resources/assets_manager.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/presentation/splash/controller/splash_controller.dart';

import '../../../../core/resources/colors_mangaer.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorsManager.splashBackground,
      body: GetBuilder<SplashController>(
          init: SplashController(),

          builder: (context) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                Image.asset(
                  AssetsManager.appLogo,
                  width: controller.animation.value * 800,
                  height: controller.animation.value *800,
                  // Provide explicit width and height attributes for the SVG
                  // You can adjust the dimensions as needed

                ),
              ]),
            ],
          );
        }
      ),
    );
  }
}
