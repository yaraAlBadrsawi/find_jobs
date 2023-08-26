import 'package:get/get.dart';
import 'package:graduation_project/presentation/job_seeker/profile/controller/job_seeker_profile_controller.dart';

class JobSeekerProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => JobSeekerProfileController());
  }
}
