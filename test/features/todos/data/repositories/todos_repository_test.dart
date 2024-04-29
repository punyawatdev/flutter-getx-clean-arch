// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/data/datasources/local/todos_local_data_source.dart';
import 'package:flutter_getx_clean_arch/features/todos/data/datasources/mappers/entity_to_local_mapper.dart';
import 'package:flutter_getx_clean_arch/features/todos/data/models/todo.dart';
import 'package:flutter_getx_clean_arch/features/todos/data/repositories/todos_repository.dart';
import 'package:flutter_getx_clean_arch/features/todos/domain/entities/todo.dart';
import 'todos_repository_test.mocks.dart';

@GenerateMocks([TodosDataSource])
void main() {
  group('Todos Repository Test', () {
    late MockTodosDataSource mockTodosDataSource;
    late TodosRepositoryImpl todosRepository;
    final currentDateTime = DateTime(2024, 4, 27);

    setUp(() {
      mockTodosDataSource = MockTodosDataSource();
      todosRepository = TodosRepositoryImpl(mockTodosDataSource);
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

      when(mockTodosDataSource.getTodos())
          .thenAnswer((inv) => Future.value(todos));

      final result = await todosRepository.getTodos();
      verify(mockTodosDataSource.getTodos()).called(1);
      expect(result.length, 2);
      expect(result[0].title, 'Test Todo 1');
      expect(result[1].isCompleted, true);
    });

    test('Add Todo', () async {
      final todo = Todo(
          id: '1',
          title: 'Test Todo',
          description: 'Test Description',
          isCompleted: false,
          createdDate: currentDateTime);

      await todosRepository.addTodo(todo);

      final todoHiveModel = todo.toHiveModel();
      verify(mockTodosDataSource.addTodo(todoHiveModel)).called(1);
    });

    test('Update Todo', () async {
      final updatedTodo = Todo(
          id: '1',
          title: 'Updated Todo',
          description: 'Updated Description',
          isCompleted: true,
          createdDate: currentDateTime);

      await todosRepository.updateTodo(updatedTodo);

      final updatedTodoHiveModel = updatedTodo.toHiveModel();
      verify(mockTodosDataSource.updateTodo(updatedTodoHiveModel)).called(1);
    });

    test('Update Todo Status', () async {
      const todoId = '1';

      await todosRepository.updateTodoStatus(todoId, false);

      verify(mockTodosDataSource.updateTodoStatus(todoId, false)).called(1);
    });

    test('Delete Todo', () async {
      const todoId = '1';

      await todosRepository.deleteTodo(todoId);

      verify(mockTodosDataSource.deleteTodo(todoId)).called(1);
    });

    test('Toggle Completed All Todo', () async {
      when(mockTodosDataSource.toggleCompletedAll())
          .thenAnswer((inv) => Future.value(1));

      final todosToggleLength = await todosRepository.toggleCompletedAll();

      verify(mockTodosDataSource.toggleCompletedAll()).called(1);
      expect(todosToggleLength, 1);
    });

    test('Clear Completed All Todo', () async {
      when(mockTodosDataSource.clearCompleted())
          .thenAnswer((inv) => Future.value(2));

      final todosClearLength = await todosRepository.clearCompleted();

      verify(mockTodosDataSource.clearCompleted()).called(1);
      expect(todosClearLength, 2);
    });
  });
}
