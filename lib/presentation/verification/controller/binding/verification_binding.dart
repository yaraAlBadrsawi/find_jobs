import 'package:get/get.dart';
import 'package:graduation_project/presentation/verification/controller/verification_controller.dart';

class VerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerificationController());
  }
}
