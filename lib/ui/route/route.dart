
import 'package:get/get.dart';
import 'package:shoesphere/ui/views/auth/forget_password.dart';
import 'package:shoesphere/ui/views/auth/login.dart';
import 'package:shoesphere/ui/views/auth/registration.dart';
import 'package:shoesphere/ui/views/not_found.dart';
import 'package:shoesphere/ui/views/onboarding.dart';
import 'package:shoesphere/ui/views/splash.dart';

const String splash = '/splash-screen';
const String unknown = '/not-found';
const String intro = '/intro';
const String login = '/login';
const String registration = '/registration';
const String forgetPass = '/forgetPass';

List<GetPage> getPages = [
  GetPage(
    name: unknown,
    page: () => const Unknown(),
  ),
  GetPage(
    name: splash,
    page: () => const Splash(),

  ),
  GetPage(
    name: intro,
    page: () => const Onboarding(),

  ),
  GetPage(
    name: login,
    page: () =>  Login(),

  ),
  GetPage(
    name: registration,
    page: () => const Registration(),

  ),
  GetPage(
    name: forgetPass,
    page: () => const ForgetPassword(),

  ),
];