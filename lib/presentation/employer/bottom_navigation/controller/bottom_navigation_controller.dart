import 'package:get/get.dart';

class EmployerBottomNavigationBarController extends GetxController {
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }
}
