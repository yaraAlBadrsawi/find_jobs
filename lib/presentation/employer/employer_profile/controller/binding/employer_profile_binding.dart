import 'package:get/get.dart';
import 'package:graduation_project/presentation/employer/employer_profile/controller/employer_profile_controller.dart';

class EmployerProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmployerProfileController());
  }
}
