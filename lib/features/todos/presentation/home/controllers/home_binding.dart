// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/presentation/home/controllers/home_controller.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/stats/controllers/stats_binding.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/todos/controllers/todos_binding.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    TodosBinding().dependencies();
    StatsBinding().dependencies();
  }
}
