import 'package:get/get.dart';
import 'package:graduation_project/presentation/auth/login/controller/login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyReplace(() => LoginController());
  }

}