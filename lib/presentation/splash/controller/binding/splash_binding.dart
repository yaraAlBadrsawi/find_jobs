import 'package:get/get.dart';
import 'package:graduation_project/presentation/splash/controller/splash_controller.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {

  Get.lazyPut(() => SplashController());

  }
}