import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:graduation_project/presentation/job_seeker/notification/controller/job_seeker_notification_controller.dart';

class JobSeekerNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => JobSeekerNotificationController());
  }
}
