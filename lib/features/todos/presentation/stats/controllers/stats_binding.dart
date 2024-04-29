// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/domain/usecases/todos_usecase.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/stats/controllers/stats_controller.dart';

class StatsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StatsController(todosUseCase: Get.find<TodosUseCase>()));
  }
}
