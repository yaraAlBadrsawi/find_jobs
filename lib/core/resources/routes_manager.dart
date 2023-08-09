import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:graduation_project/presentation/auth/login/view/login_view.dart';
import 'package:graduation_project/presentation/auth/register/view/register_view.dart';
import 'package:graduation_project/presentation/employer/add_job/view/add_job_view.dart';
import 'package:graduation_project/presentation/employer/home/view/employer_home_view.dart';
import 'package:graduation_project/presentation/job_seeker/bottom_navigation/controller/bottom_navigation_controller.dart';
import 'package:graduation_project/presentation/job_seeker/bottom_navigation/view/bottom_navigation_view.dart';
import 'package:graduation_project/presentation/job_seeker/home/controller/user_home_controller.dart';
import 'package:graduation_project/presentation/job_seeker/home/view/user_home_view.dart';
import 'package:graduation_project/presentation/onboarding/view/on_boarding_view.dart';
import 'package:graduation_project/presentation/verification/controller/binding/verification_binding.dart';

import '../../presentation/auth/foregot_password/controller/binding/forget_password_binding.dart';
import '../../presentation/auth/foregot_password/view/forget_password.dart';
import '../../presentation/auth/login/controller/binding/login_binding.dart';
import '../../presentation/auth/register/controller/binding/register_binding.dart';
import '../../presentation/employer/add_job/controller/binding/add_job_binding.dart';
import '../../presentation/employer/bottom_navigation/binding/bottom_navigation_binding.dart';
import '../../presentation/employer/bottom_navigation/view/bottom_navigation_view.dart';
import '../../presentation/job_seeker/bottom_navigation/binding/bottom_navigation_binding.dart';
import '../../presentation/job_seeker/home/controller/binding/user_binding.dart';
import '../../presentation/onboarding/controller/binding/on_boaring_binding.dart';
import '../../presentation/splash/view/splash_view/splash_view.dart';
import '../../presentation/verification/view/verification_view.dart';

class Routes {
  static const String jobsHome = '/job_seeker_home';
  static const String jobSeekerHome = '/job_seeker_home';
  static const String employerHome = '/employer_home';

  static const String onBoarding = '/on_boarding';
  static const String splashView = '/splash_view';
  static const String loginView = '/login_view';
  static const String registerView = '/register_view';
  static const String forgetPasswordView = '/forget_password_view';
  static const String jobSeekerBottomBarView = '/job_seeker_bottom_bar';
  static const String employerBottomBarView = '/job_seeker_bottom_bar';
  static const String verificationView = '/verification_view';
  static const String addJobView = '/add_job_view';

  static final routes = [
    GetPage(
      name: Routes.splashView,
      page: () => SplashView(),
    ),
    GetPage(
        name: Routes.onBoarding,
        page: () => const OnBoardingView(),
        binding: OnBoardingBinding()),

    GetPage(
        name: Routes.registerView,
        page: () => RegisterView(),
        binding: RegisterBinding()),
    GetPage(
        name: Routes.loginView,
        page: () => const LoginView(),
        binding: LoginBinding()),
    GetPage(
        name: Routes.forgetPasswordView,
        page: () => ForgetPasswordView(),
        binding: ForgetPasswordBinding()),
    GetPage(
        name: Routes.employerHome,
        page: () => EmployerHomeView(),
        binding: RegisterBinding()),

    GetPage(
        name: Routes.jobSeekerHome,
        page: () => UserHomeView(),
        binding: UserHomeBinding()),
    GetPage(
        name: Routes.jobSeekerBottomBarView,
        page: () => UserBottomNavigationBarView(),
        binding: UserBottomNavigationBinding()),

    GetPage(
        name: Routes.employerBottomBarView,
        page: () => const EmployerBottomNavigationBarView(),
        binding: EmployerBottomNavigationBinding()),

    GetPage(
        name: Routes.verificationView,
        page: () => const VerificationView(),
        binding: VerificationBinding()),

    GetPage(
        name: Routes.addJobView,
        page: () => const AddJobView(),
        binding: AddJobBinding()

    ),
    // binding: SignInBinding(),
  ];
}
