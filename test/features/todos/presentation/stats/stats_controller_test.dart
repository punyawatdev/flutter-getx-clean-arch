// Package imports:
import 'package:flutter_getx_clean_arch/features/todos/presentation/todos/controllers/todos_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/domain/entities/todo.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/stats/controllers/stats_controller.dart';
import '../todos/todos_controller_test.mocks.dart';

void main() {
  late MockTodosUseCase mockTodosUseCase;
  late MockUuid mockUuid;
  late MockSnackBarMessenger mockSnackBarMessenger;
  final currentDateTime = DateTime(2024, 4, 27);

  setUpAll(() {
    // Create Mocks
    mockTodosUseCase = MockTodosUseCase();
    mockUuid = MockUuid();
    mockSnackBarMessenger = MockSnackBarMessenger();
  });

  group('StatsController Test', () {
    test('initialize data ', () async {
      // Mocking the behavior of TodosUsecase to return a list of todos
      when(mockTodosUseCase.getTodos()).thenAnswer((_) async => []);

      // Create TodosController
      final todosController = Get.put(TodosController(
        todosUseCase: mockTodosUseCase,
        uuidGenerator: mockUuid,
        snackBarMessenger: mockSnackBarMessenger,
        currentDateTime: () => currentDateTime,
      ));

      // Create StatsController
      final statsController =
          Get.put(StatsController(todoController: todosController));

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

      // Todos Controller
      final todosController = Get.find<TodosController>();

      // Get todos data
      await todosController.getTodos();

      // Stats Controller
      final statsController = Get.find<StatsController>();

      // Verify the new activeTodos and completedTodos value.
      expect(statsController.activeTodos, 1);
      expect(statsController.completedTodos, 2);

      // Delete GetX Instance<S>.
      Get.delete<TodosController>();
      Get.delete<StatsController>();
    });
  });
}
