import 'package:get/get.dart';
import 'package:graduation_project/presentation/job_seeker/home/controller/user_home_controller.dart';

class UserHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserHomeController());
  }
}
