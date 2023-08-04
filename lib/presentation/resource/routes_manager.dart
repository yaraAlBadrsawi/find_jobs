import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:graduation_project/presentation/onboarding/view/on_boarding_view.dart';
import 'package:graduation_project/presentation/onboarding/view_model/binding/on_boaring_binding.dart';

import '../splash/view/splash_view/splash_view.dart';

class Routes{
  static const String jobsHome='/job_seeker_home';
  static const String jobSeekerHome='/job_seeker_home';
  static const String loginView='/job_seeker_home';
  static const String onBoarding='/on_boarding';
  static const String splash='/splash_view';



  static final routes = [
  GetPage(
  name: Routes.splash,
  page: () => SplashView(),

  ),
  GetPage(
  name: Routes.onBoarding,
  page: () => const OnBoardingView(),
  binding:OnBoardingBinding()

  ),
  // binding: SignInBinding(),
  ];


}