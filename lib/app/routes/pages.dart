import 'package:get/get.dart';

import '../exports.dart';

part 'routes.dart';

/// Pages
class Pages {
  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Paths.tasks,
      page: () => TasksView(),
      binding: TasksBinding(),
    ),
  ];
}
