// Package imports:
import 'package:hive_flutter/hive_flutter.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/data/models/todo.dart';

abstract class TodosDataSource {
  Future<List<TodoHiveModel>> getTodos();
  Future<void> addTodo(TodoHiveModel todo);
  Future<void> updateTodo(TodoHiveModel todo);
  Future<void> updateTodoStatus(String todoId, bool isCompleted);
  Future<void> deleteTodo(String todoId);
  Future<int> toggleCompletedAll();
  Future<int> clearCompleted();
}

class TodosLocalDataSource implements TodosDataSource {
  final Box<TodoHiveModel> _database;

  TodosLocalDataSource(this._database);

  @override
  Future<List<TodoHiveModel>> getTodos() async {
    final items = _database.values.toList(growable: false);
    items.sort((a, b) => b.createdDate.compareTo(a.createdDate));
    return items.whereType<TodoHiveModel>().toList();
  }

  @override
  Future<void> addTodo(TodoHiveModel todo) {
    return _database.put(todo.id, todo);
  }

  @override
  Future<void> updateTodo(TodoHiveModel todo) {
    return _database.put(todo.id, todo);
  }

  @override
  Future<void> updateTodoStatus(String todoId, bool isCompleted) {
    final TodoHiveModel todoHiveModel = _database.get(todoId)!;
    return _database.put(
      todoHiveModel.id,
      TodoHiveModel(
        id: todoHiveModel.id,
        title: todoHiveModel.title,
        description: todoHiveModel.description,
        isCompleted: isCompleted,
        createdDate: todoHiveModel.createdDate,
      ),
    );
  }

  @override
  Future<void> deleteTodo(String todoId) {
    return _database.delete(todoId);
  }

  @override
  Future<int> toggleCompletedAll() async {
    final todos = _database.values;
    todos.where((t) => !t.isCompleted);
    Map<String, TodoHiveModel> todosCompleted = {
      for (var todo in todos)
        todo.id: TodoHiveModel(
          id: todo.id,
          title: todo.title,
          description: todo.description,
          isCompleted: true,
          createdDate: todo.createdDate,
        )
    };
    await _database.putAll(todosCompleted);
    return todos.length;
  }

  @override
  Future<int> clearCompleted() async {
    final todos = _database.values.where((todo) => todo.isCompleted).toList();
    for (final todo in todos) {
      await _database.delete(todo.id);
    }
    return todos.length;
  }
}
