// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/data/datasources/local/todos_local_data_source.dart';
import 'package:flutter_getx_clean_arch/features/todos/data/datasources/mappers/entity_to_local_mapper.dart';
import 'package:flutter_getx_clean_arch/features/todos/data/datasources/mappers/local_to_entity_mapper.dart';
import 'package:flutter_getx_clean_arch/features/todos/data/models/todo.dart';
import 'package:flutter_getx_clean_arch/features/todos/domain/entities/todo.dart';

abstract class TodosRepository {
  Future<List<Todo>> getTodos();
  Future<void> addTodo(Todo todo);
  Future<void> updateTodo(Todo todo);
  Future<void> updateTodoStatus(String todoId, bool isCompleted);
  Future<void> deleteTodo(String todoId);
  Future<int> toggleCompletedAll();
  Future<int> clearCompleted();
}

class TodosRepositoryImpl implements TodosRepository {
  final TodosDataSource dataSource;

  TodosRepositoryImpl(this.dataSource);

  @override
  Future<List<Todo>> getTodos() async {
    List<TodoHiveModel> todos = await dataSource.getTodos();
    return todos.map((todo) => todo.toEntity()).toList();
  }

  @override
  Future<void> addTodo(Todo entity) {
    TodoHiveModel model = entity.toHiveModel();
    return dataSource.addTodo(model);
  }

  @override
  Future<void> updateTodo(Todo entity) async {
    TodoHiveModel model = entity.toHiveModel();
    return await dataSource.updateTodo(model);
  }

  @override
  Future<void> updateTodoStatus(String todoId, bool isCompleted) {
    return dataSource.updateTodoStatus(todoId, isCompleted);
  }

  @override
  Future<void> deleteTodo(String todoId) {
    return dataSource.deleteTodo(todoId);
  }

  @override
  Future<int> toggleCompletedAll() {
    return dataSource.toggleCompletedAll();
  }

  @override
  Future<int> clearCompleted() {
    return dataSource.clearCompleted();
  }
}
