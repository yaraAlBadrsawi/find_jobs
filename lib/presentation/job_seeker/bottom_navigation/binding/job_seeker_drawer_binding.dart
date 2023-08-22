import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:graduation_project/presentation/job_seeker/bottom_navigation/view/job_seeker_drawer_view.dart';

class JobSeekerDrawerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => JobSeekerDrawer());
    // Get.lazyPut(() => ProfileController());
  }
}