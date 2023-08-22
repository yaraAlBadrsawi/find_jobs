import 'package:get/get.dart';
import 'package:graduation_project/presentation/job_seeker/interest/controller/interest_controller.dart';

class InterestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InterestController());
  }
}
