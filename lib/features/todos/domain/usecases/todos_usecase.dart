// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/data/repositories/todos_repository.dart';
import 'package:flutter_getx_clean_arch/features/todos/domain/entities/todo.dart';

class TodosUseCase {
  final TodosRepository _repository;

  TodosUseCase(this._repository);

  Future<List<Todo>> getTodos() {
    return _repository.getTodos();
  }

  Future<void> addTodo(Todo todo) {
    return _repository.addTodo(todo);
  }

  Future<void> updateTodo(Todo todo) {
    return _repository.updateTodo(todo);
  }

  Future<void> updateTodoStatus(String todoId, bool isCompleted) {
    return _repository.updateTodoStatus(todoId, isCompleted);
  }

  Future<void> deleteTodo(String todoId) {
    return _repository.deleteTodo(todoId);
  }

  Future<int> toggleCompletedAll() {
    return _repository.toggleCompletedAll();
  }

  Future<int> clearCompleted() {
    return _repository.clearCompleted();
  }
}
