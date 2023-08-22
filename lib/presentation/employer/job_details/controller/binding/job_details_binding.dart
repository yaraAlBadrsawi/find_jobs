import 'package:get/get.dart';

import '../job_details_controller.dart';

class JobDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => JobDetailsController());
  }
}
