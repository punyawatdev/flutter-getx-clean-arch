// Package imports:

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/data/repositories/todos_repository.dart';
import 'package:flutter_getx_clean_arch/features/todos/domain/entities/todo.dart';
import 'package:flutter_getx_clean_arch/features/todos/domain/usecases/todos_usecase.dart';
import 'todos_usecase_test.mocks.dart';

@GenerateMocks([TodosRepository])
void main() {
  group('Todos Usecase Test', () {
    late MockTodosRepository mockTodosRepository;
    late TodosUseCase todosUseCase;
    final currentDateTime = DateTime(2024, 4, 27);

    setUp(() {
      mockTodosRepository = MockTodosRepository();
      todosUseCase = TodosUseCase(mockTodosRepository);
    });

    test('Get All Todos', () async {
      final todos = [
        Todo(
            id: '1',
            title: 'Test Todo 1',
            description: 'Test Description 1',
            isCompleted: false,
            createdDate: currentDateTime),
        Todo(
            id: '2',
            title: 'Test Todo 2',
            description: 'Test Description 2',
            isCompleted: true,
            createdDate: currentDateTime),
      ];

      when(mockTodosRepository.getTodos())
          .thenAnswer((inv) => Future.value(todos));

      final result = await todosUseCase.getTodos();
      verify(mockTodosRepository.getTodos()).called(1);
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

      await todosUseCase.addTodo(todo);

      verify(mockTodosRepository.addTodo(todo)).called(1);
    });

    test('Update Todo', () async {
      final updatedTodo = Todo(
          id: '1',
          title: 'Updated Todo',
          description: 'Updated Description',
          isCompleted: true,
          createdDate: currentDateTime);

      await todosUseCase.updateTodo(updatedTodo);

      verify(mockTodosRepository.updateTodo(updatedTodo)).called(1);
    });

    test('Update Todo Status', () async {
      const todoId = '1';

      await todosUseCase.updateTodoStatus(todoId, false);

      verify(mockTodosRepository.updateTodoStatus(todoId, false)).called(1);
    });

    test('Delete Todo', () async {
      const todoId = '1';

      await todosUseCase.deleteTodo(todoId);

      verify(mockTodosRepository.deleteTodo(todoId)).called(1);
    });

    test('Toggle Completed All Todo', () async {
      when(mockTodosRepository.toggleCompletedAll())
          .thenAnswer((inv) => Future.value(1));

      final todosToggleLength = await todosUseCase.toggleCompletedAll();

      verify(mockTodosRepository.toggleCompletedAll()).called(1);
      expect(todosToggleLength, 1);
    });

    test('Clear Completed All Todo', () async {
      when(mockTodosRepository.clearCompleted())
          .thenAnswer((inv) => Future.value(2));

      final todosClearLength = await todosUseCase.clearCompleted();

      verify(mockTodosRepository.clearCompleted()).called(1);
      expect(todosClearLength, 2);
    });
  });
}
