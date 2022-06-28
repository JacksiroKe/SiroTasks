import 'package:get/get.dart';

import '../exports.dart';

part 'routes.dart';

/// Pages
class Pages {
  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: Paths.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
