import 'package:get/get.dart';
import 'package:graduation_project/presentation/auth/controller/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
 Get.lazyPut(() => RegisterController()) ; 
  }

}