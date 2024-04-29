// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/data/datasources/local/todos_local_data_source.dart';
import 'package:flutter_getx_clean_arch/features/todos/data/models/todo.dart';
import 'todos_datasources_test.mocks.dart';

@GenerateMocks([Box<TodoHiveModel>])
void main() {
  group('Todos Data Source Test', () {
    late MockBox<TodoHiveModel> mockBox;
    late TodosLocalDataSource todosLocalDataSource;
    final currentDateTime = DateTime(2024, 4, 27);

    setUp(() {
      mockBox = MockBox();
      todosLocalDataSource = TodosLocalDataSource(mockBox);
    });

    test('Get All Todos', () async {
      final todos = [
        TodoHiveModel(
            id: '1',
            title: 'Test Todo 1',
            description: 'Test Description 1',
            isCompleted: false,
            createdDate: currentDateTime),
        TodoHiveModel(
            id: '2',
            title: 'Test Todo 2',
            description: 'Test Description 2',
            isCompleted: true,
            createdDate: currentDateTime),
      ];

      // Mocking the behavior of Hive to return a list of todos
      when(mockBox.values).thenReturn(todos);

      final result = await todosLocalDataSource.getTodos();
      expect(result.length, 2);
      expect(result[0].title, 'Test Todo 1');
      expect(result[1].isCompleted, true);
      expect(result, equals(todos));
    });

    test('Add Todo', () async {
      final todo = TodoHiveModel(
          id: '1',
          title: 'Test Todo',
          description: 'Test Description',
          isCompleted: false,
          createdDate: currentDateTime);

      await todosLocalDataSource.addTodo(todo);

      verify(mockBox.put(todo.id, todo)).called(1);
    });

    test('Update Todo', () async {
      final updatedTodo = TodoHiveModel(
          id: '1',
          title: 'Updated Todo',
          description: 'Updated Description',
          isCompleted: true,
          createdDate: currentDateTime);

      await todosLocalDataSource.updateTodo(updatedTodo);

      verify(mockBox.put(updatedTodo.id, updatedTodo)).called(1);
    });

    test('Update Todo Status', () async {
      final updatedTodo = TodoHiveModel(
          id: '1',
          title: 'Updated Todo',
          description: 'Updated Description',
          isCompleted: true,
          createdDate: currentDateTime);
      final actualUpdatedTodo = TodoHiveModel(
          id: '1',
          title: 'Updated Todo',
          description: 'Updated Description',
          isCompleted: false,
          createdDate: currentDateTime);

      when(mockBox.get(any)).thenReturn(updatedTodo);

      await todosLocalDataSource.updateTodoStatus(updatedTodo.id, false);

      verify(mockBox.put(updatedTodo.id, actualUpdatedTodo)).called(1);
    });

    test('Delete Todo', () async {
      const todoId = '1';

      await todosLocalDataSource.deleteTodo(todoId);

      verify(mockBox.delete(todoId)).called(1);
    });

    test('Toggle Completed All Todo', () async {
      final todos = [
        TodoHiveModel(
            id: '1',
            title: 'Test Todo 1',
            description: 'Test Description 1',
            isCompleted: false,
            createdDate: currentDateTime),
        TodoHiveModel(
            id: '2',
            title: 'Test Todo 2',
            description: 'Test Description 2',
            isCompleted: true,
            createdDate: currentDateTime),
      ];

      // Mocking the behavior of Hive to return a list of todos
      when(mockBox.values).thenReturn(todos);

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

      final todosToggleLength = await todosLocalDataSource.toggleCompletedAll();

      verify(mockBox.putAll(todosCompleted)).called(1);
      expect(todosToggleLength, 2);
    });

    test('Clear Completed All Todo', () async {
      final todos = [
        TodoHiveModel(
            id: '1',
            title: 'Test Todo 1',
            description: 'Test Description 1',
            isCompleted: false,
            createdDate: currentDateTime),
        TodoHiveModel(
            id: '2',
            title: 'Test Todo 2',
            description: 'Test Description 2',
            isCompleted: true,
            createdDate: currentDateTime),
      ];

      // Mocking the behavior of Hive to return a list of todos
      when(mockBox.values).thenReturn(todos);

      final todosClearLength = await todosLocalDataSource.clearCompleted();

      verify(mockBox.delete(any)).called(1);
      expect(todosClearLength, 1);
    });
  });
}
