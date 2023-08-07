import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../config/constants.dart';
import 'package:graduation_project/core/resources/assets_manager.dart';
import 'package:graduation_project/core/resources/routes_manager.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import '../view/widget/on_boarding_item.dart';

class OnBoardingController extends GetxController {

  // final instance = GetIt.instance;

  // final AppSettingsSharedPreferences _appSettingsSharedPreferences =
  // instance<AppSettingsSharedPreferences>();

  late PageController pageController;
  static const firstPage = 0;
  static const lastPage = 2;
  int currentPage = firstPage;

  final List pageViewItems = [
    OnBoardingItem(
      image: AssetsManager.onBoardingIllustration1,
      title: StringsManager.onBoardingTitle1,
      subTitle: StringsManager.onBoardingSubTitle1,
    ),
    OnBoardingItem(      image: AssetsManager.onBoardingIllustration1,
      title: StringsManager.onBoardingTitle2,
      subTitle: StringsManager.onBoardingSubTitle2,
    ),
    OnBoardingItem(      image: AssetsManager.onBoardingIllustration1
      ,
      title: StringsManager.onBoardingTitle3,
      subTitle: StringsManager.onBoardingSubTitle3,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  Future<void> setCurrentPage(int index) async {
    // await _appSettingsSharedPreferences.setOutBoardingViewed();
    currentPage = index;
    update();
  }

  void skipPage() {
    animateToPage(index: lastPage);
    currentPage = lastPage;
    update();
  }

  void nextPage() {
    if (isNotLastedPage()) {
      animateToPage(index: ++currentPage);
      update();
    }
  }

  Future<void> getStart() async {
    // await _appSettingsSharedPreferences.setOutBoardingViewed();
    Get.offAllNamed(Routes.loginView);
  }

  void previousPage() {
    if (isNotFirstPage()) {
      animateToPage(index: --currentPage);
      update();
    }
  }

  Future<void> animateToPage({required int index}) {
    return pageController.animateToPage(
      index,
      duration: const Duration(seconds: Constants.onBoardingDurationTime),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  bool isNotLastedPage() {
    return currentPage < lastPage;
  }

  bool isNotFirstPage() {
    return currentPage > firstPage;
  }

  bool showBackButton() {
    return currentPage > firstPage && currentPage < lastPage;
  }

}
