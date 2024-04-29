// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/domain/entities/todo.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/stats/controllers/stats_controller.dart';
import '../todos/todos_controller_test.mocks.dart';

void main() {
  late MockTodosUseCase mockTodosUseCase;
  late StatsController statsController;
  final currentDateTime = DateTime(2024, 4, 27);

  setUpAll(() {
    // Create Mocks
    mockTodosUseCase = MockTodosUseCase();

    // Create a StatsController
    statsController = StatsController(todosUseCase: mockTodosUseCase);
  });

  group('StatsController Test', () {
    test('initialize data ', () async {
      // Verify the default activeTodos and completedTodos value.
      expect(statsController.activeTodos, 0);
      expect(statsController.completedTodos, 0);
    });

    test('should get stats todos value', () async {
      final todos = [
        Todo(
          id: '1',
          title: 'Test Todo 1',
          description: '',
          isCompleted: false,
          createdDate: currentDateTime,
        ),
        Todo(
          id: '2',
          title: 'Test Todo 2',
          description: '',
          isCompleted: true,
          createdDate: currentDateTime,
        ),
        Todo(
          id: '3',
          title: 'Test Todo 3',
          description: '',
          isCompleted: true,
          createdDate: currentDateTime,
        ),
      ];

      // Mocking the behavior of TodosUsecase to return a list of todos
      when(mockTodosUseCase.getTodos()).thenAnswer((_) async => todos);

      // get stats of todos data
      await statsController.getStatsTodos();

      // Verify the new activeTodos and completedTodos value.
      expect(statsController.activeTodos, 1);
      expect(statsController.completedTodos, 2);
    });
  });
}
