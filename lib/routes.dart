// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/presentation/edit_todo/page/edit_todo_page.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/home/controllers/home_binding.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/home/page/home_page.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/stats/controllers/stats_binding.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/stats/page/stats_page.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/todos/controllers/todos_binding.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/todos/page/todos_page.dart';

class _Paths {
  static const String home = '/';
  static const String todos = '/todos';
  static const String editTodo = '/editTodo';
  static const String stats = '/stats';
}

class AppRoutes {
  static const String initialRoute = _Paths.home;

  static List<GetPage<dynamic>> getPages = [
    GetPage(
      name: _Paths.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.todos,
      page: () => const TodosPage(),
      binding: TodosBinding(),
    ),
    GetPage(
      name: _Paths.editTodo,
      page: () => const EditTodoPage(),
    ),
    GetPage(
      name: _Paths.stats,
      page: () => const StatsPage(),
      binding: StatsBinding(),
    ),
  ];
}
