import 'package:get/get.dart';
import 'package:graduation_project/presentation/employer/add_job/controller/add_job_controller.dart';

class AddJobBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddJobController());
  }
}
