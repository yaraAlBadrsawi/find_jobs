import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:graduation_project/presentation/employer/application/controller/employer_applicatin_controller.dart';
import 'package:graduation_project/presentation/employer/employer_profile/controller/employer_profile_controller.dart';

import '../../../home/controller/employer_controller.dart';
import '../bottom_navigation_controller.dart';


class EmployerBottomNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmployerBottomNavigationBarController());
    Get.lazyPut(() => EmployerHomeController());
    Get.lazyPut(() => EmployerProfileController());
    Get.lazyPut(() => EmployerApplicationController());
    // Get.lazyPut(() => ProfileController());
  }
}
