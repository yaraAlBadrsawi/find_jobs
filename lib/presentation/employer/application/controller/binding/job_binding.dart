
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../job_controller.dart';

class JobBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => JobController());


  }

}