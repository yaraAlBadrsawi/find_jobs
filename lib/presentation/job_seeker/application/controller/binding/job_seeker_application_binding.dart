import 'package:get/get.dart';
import 'package:graduation_project/presentation/job_seeker/application/controller/job_seeker_application_controller.dart';

class JobSeekerApplicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => JobSeekerApplicationController());
  }
}
