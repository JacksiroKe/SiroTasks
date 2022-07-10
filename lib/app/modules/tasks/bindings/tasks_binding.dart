import 'package:get/get.dart';

import '../../../exports.dart';

class TasksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TasksController>(
      () => TasksController(),
    );
  }
}
