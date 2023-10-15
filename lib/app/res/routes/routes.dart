import '../../screens/splash/splash.dart';
import 'route_names.dart';
import 'package:get/get.dart';
import '../../screens/auth/view/auth.dart';
import '../../screens/onboarding/landing.dart';
import '../../screens/dashboard/home.dart';

class AppRoutes {
  static appRoutes() => [
    GetPage(name: RouteName.SPLASH, page: () => Splash()),
        GetPage(name: RouteName.ONBOARDING, page: () => LandingPage()),
        GetPage(name: RouteName.AUTH, page: () => Auth()),
        GetPage(name: RouteName.HOME, page: () => Home()),
      ];
}
