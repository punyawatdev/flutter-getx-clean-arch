// Package imports:
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/domain/entities/todo.dart';
import 'package:flutter_getx_clean_arch/features/todos/domain/usecases/todos_usecase.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/todos/utils/snack_bar.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/todos/widgets/widgets.dart';

class TodosController extends GetxController {
  final TodosUseCase todosUseCase;
  final Uuid uuidGenerator;
  final SnackBarMessenger snackBarMessenger;
  final DateTime Function() getCurrentTime;

  TodosController({
    required this.todosUseCase,
    required this.uuidGenerator,
    required this.snackBarMessenger,
    DateTime Function()? currentDateTime,
  }) : getCurrentTime = currentDateTime ?? DateTime.now;

  final _todos = <Todo>[].obs;
  final _filter = TodosViewFilter.all.obs;

  RxList<Todo> get todos => _todos.where(applyFilter).toList().obs;
  Rx<TodosViewFilter> get filter => _filter;
  RxBool get hasTodos => _todos.isNotEmpty.obs;
  RxBool get hasCompletedTodos =>
      _todos.where((todo) => todo.isCompleted).isNotEmpty.obs;

  @override
  void onInit() {
    getTodos();
    super.onInit();
  }

  bool applyFilter(Todo todo) {
    switch (_filter.value) {
      case TodosViewFilter.all:
        return true;
      case TodosViewFilter.activeOnly:
        return !todo.isCompleted;
      case TodosViewFilter.completedOnly:
        return todo.isCompleted;
    }
  }

  void onFilterChanged(TodosViewFilter filter) {
    _filter.value = filter;
    update();
  }

  Future<void> getTodos() async {
    List<Todo> todos = await todosUseCase.getTodos();
    _todos.assignAll(todos);
    update();
  }

  Future<void> addTodo({required String title, String? description}) async {
    Todo todo = Todo(
      id: uuidGenerator.v4(),
      title: title,
      description: description ?? '',
      isCompleted: false,
      createdDate: getCurrentTime(),
    );
    await todosUseCase.addTodo(todo);
    getTodos();
  }

  Future<void> updateTodo(
    Todo todo, {
    required String title,
    String? description,
  }) async {
    Todo data = Todo(
      id: todo.id,
      title: title,
      description: description ?? '',
      isCompleted: todo.isCompleted,
      createdDate: getCurrentTime(),
    );
    await todosUseCase.updateTodo(data);
    getTodos();
  }

  Future<void> toggleTodoStatus(String todoId, bool isCompleted) async {
    await todosUseCase.updateTodoStatus(todoId, isCompleted);
    getTodos();
  }

  Future<void> deleteTodo(Todo todo) async {
    await todosUseCase.deleteTodo(todo.id);
    getTodos();
    showDeleteSnackBar(deletedTodo: todo);
  }

  Future<void> toggleCompletedAll() async {
    await todosUseCase.toggleCompletedAll();
    getTodos();
  }

  Future<void> clearCompleted() async {
    await todosUseCase.clearCompleted();
    getTodos();
  }

  void showDeleteSnackBar({required Todo deletedTodo}) {
    // NOTE: alert the message of item deleted
    snackBarMessenger.showDeletedMessage(
      message: 'Todo "${deletedTodo.title}" deleted.',
      undo: () => unDeleteTodo(deletedTodo),
    );
  }

  Future<void> unDeleteTodo(Todo todo) async {
    await todosUseCase.addTodo(todo);
    getTodos();
  }
}
