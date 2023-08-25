import 'package:get/get.dart';

import '../employer_job_details_controller.dart';

class EmployerJobDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmployerJobDetailsController());
  }
}
