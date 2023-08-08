import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import '../../home/controller/employer_controller.dart';
import '../controller/bottom_navigation_controller.dart';

class EmployerBottomNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmployerBottomNavigationBarController());
    Get.lazyPut(() => EmployerHomeController());
    // Get.lazyPut(() => ProfileController());
  }
}
