import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:graduation_project/presentation/auth/controller/binding/register_binding.dart';
import 'package:graduation_project/presentation/auth/login/view/login_view.dart';
import 'package:graduation_project/presentation/auth/register/view/register_view.dart';
import 'package:graduation_project/presentation/employer/home/view/employer_home_view.dart';
import 'package:graduation_project/presentation/onboarding/view/on_boarding_view.dart';

import '../../presentation/onboarding/controller/binding/on_boaring_binding.dart';
import '../../presentation/splash/view/splash_view/splash_view.dart';



class Routes{
  static const String jobsHome='/job_seeker_home';
  static const String jobSeekerHome='/job_seeker_home';
  static const String employerHome='/employer_home';
  static const String loginView='/login_view';
  static const String registerView='/register_view';
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
    GetPage(
        name: Routes.loginView,
        page: () => const LoginView(),
        // binding:OnBoardingBinding()

    ),

    GetPage(
      name: Routes.registerView,
      page: () =>  RegisterView(),
      binding:RegisterBinding()

    ),
    GetPage(
        name: Routes.employerHome,
        page: () =>  EmployerHomeView(),
        binding:RegisterBinding()

    ),
  // binding: SignInBinding(),
  ];


}