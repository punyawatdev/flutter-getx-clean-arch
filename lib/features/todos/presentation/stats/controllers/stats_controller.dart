// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/domain/entities/todo.dart';
import 'package:flutter_getx_clean_arch/features/todos/domain/usecases/todos_usecase.dart';

class StatsController extends GetxController {
  final TodosUseCase todosUseCase;

  StatsController({required this.todosUseCase});

  final RxInt _completedTodos = 0.obs;
  final RxInt _activeTodos = 0.obs;

  int get completedTodos => _completedTodos.value;
  int get activeTodos => _activeTodos.value;

  Future<void> getStatsTodos() async {
    List<Todo> todos = await todosUseCase.getTodos();
    _completedTodos.value = todos.where((todo) => todo.isCompleted).length;
    _activeTodos.value = todos.where((todo) => !todo.isCompleted).length;
    update();
  }
}
