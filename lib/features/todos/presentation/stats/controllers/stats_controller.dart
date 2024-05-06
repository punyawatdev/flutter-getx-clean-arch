// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/presentation/todos/controllers/todos_controller.dart';

class StatsController extends GetxController {
  final TodosController todoController;

  StatsController({required this.todoController});

  int get completedTodos =>
      todoController.todos.where((todo) => todo.isCompleted).length;
  int get activeTodos =>
      todoController.todos.where((todo) => !todo.isCompleted).length;
}
