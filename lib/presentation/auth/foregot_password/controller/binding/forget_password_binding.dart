import 'package:get/get.dart';
import 'package:graduation_project/presentation/auth/foregot_password/controller/forget_password_controller.dart';

class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordController());
  }
}
