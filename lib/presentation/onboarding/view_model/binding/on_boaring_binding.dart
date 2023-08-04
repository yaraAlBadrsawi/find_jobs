import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:graduation_project/presentation/onboarding/view_model/on_boarding_controller.dart';

class OnBoardingBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut(()=>OnBoardingController()) ;

  }

}