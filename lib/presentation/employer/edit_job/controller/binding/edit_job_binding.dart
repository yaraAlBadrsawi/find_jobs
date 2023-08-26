import 'package:get/get.dart';
import 'package:graduation_project/presentation/employer/edit_job/controller/edit_job_controller.dart';

class EditJobBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditJobController());
  }
}
