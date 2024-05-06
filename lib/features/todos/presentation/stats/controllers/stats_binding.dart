// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/presentation/stats/controllers/stats_controller.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/todos/controllers/todos_controller.dart';

class StatsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => StatsController(
        todoController: Get.find<TodosController>(),
      ),
    );
  }
}
