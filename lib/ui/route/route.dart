
import 'package:get/get.dart';
import 'package:shoesphere/business_logics/bindings/auth_binding.dart';
import 'package:shoesphere/business_logics/bindings/splash_binding.dart';
import 'package:shoesphere/ui/views/auth/bottom_nav_controller.dart';
import 'package:shoesphere/ui/views/auth/forget_password.dart';
import 'package:shoesphere/ui/views/auth/login.dart';
import 'package:shoesphere/ui/views/auth/registration.dart';
import 'package:shoesphere/ui/views/auth/terms_conndition.dart';
import 'package:shoesphere/ui/views/not_found.dart';
import 'package:shoesphere/ui/views/onboarding.dart';
import 'package:shoesphere/ui/views/splash.dart';

const String splash = '/splash-screen';
const String unknown = '/not-found';
const String intro = '/intro';
const String login = '/login';
const String registration = '/registration';
const String forgetPass = '/forgetPass';
const String terms = '/terms';
const String bottomNav = '/bottomNav';

List<GetPage> getPages = [
  GetPage(
    name: unknown,
    page: () => const Unknown(),
  ),
  GetPage(
    name: splash,
    page: () => Splash(),
    binding: SplashBinding(),

  ),
  GetPage(
    name: intro,
    page: () => const Onboarding(),

  ),
  GetPage(
    name: login,
    page: () =>  Login(),
      binding: AuthBinding()

  ),
  GetPage(
    name: registration,
    page: () =>  Registration(),
    binding: AuthBinding()

  ),
  GetPage(
    name: forgetPass,
    page: () =>  ForgetPassword(),
      binding: AuthBinding()

  ),

  GetPage(
    name: terms,
    page: () => const TermCondition(),

  ),

  GetPage(
    name: bottomNav,
    page: () =>  BottomNavController(),

  ),
];