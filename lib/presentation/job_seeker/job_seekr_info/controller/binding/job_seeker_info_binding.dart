import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:graduation_project/presentation/employer/employer_info/controller/employer_info_controller.dart';

import '../job_seeker_info_controller.dart';

class JobSeekerInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>JobSeekerInfoController());
  }

}