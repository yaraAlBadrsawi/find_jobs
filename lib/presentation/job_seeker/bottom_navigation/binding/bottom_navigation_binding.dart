import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:graduation_project/presentation/job_seeker/application/controller/job_seeker_application_controller.dart';
import 'package:graduation_project/presentation/job_seeker/home/controller/user_home_controller.dart';
import '../../profile/controller/job_seeker_profile_controller.dart';
import '../controller/bottom_navigation_controller.dart';

class UserBottomNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserBottomNavigationBarController());
    Get.lazyPut(() => UserHomeController());
    Get.lazyPut(() => JobSeekerApplicationController());
    Get.lazyPut(() => JobSeekerProfileController());
    // Get.lazyPut(() => ProfileController());
  }
}
