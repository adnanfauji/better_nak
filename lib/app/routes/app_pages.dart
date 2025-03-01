import 'package:get/get.dart';
import 'package:better_nak/app/modules/auth/bindings/auth_binding.dart';
import 'package:better_nak/app/modules/auth/views/login_view.dart';
import 'package:better_nak/app/modules/home/views/home_view.dart';
import 'package:better_nak/app/modules/welcome/views/welcome_view.dart';
import 'package:better_nak/app/modules/splash/views/splash_view.dart'; // Import SplashView
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashView(), // Tambahkan SplashView
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.welcome,
      page: () => const WelcomeView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginView(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      transition: Transition.rightToLeft,
    ),
  ];
}
