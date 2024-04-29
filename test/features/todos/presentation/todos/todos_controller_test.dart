// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/domain/entities/todo.dart';
import 'package:flutter_getx_clean_arch/features/todos/domain/usecases/todos_usecase.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/todos/controllers/todos_controller.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/todos/utils/snack_bar.dart';
import 'todos_controller_test.mocks.dart';

@GenerateMocks([TodosUseCase, Uuid, SnackBarMessenger])
void main() {
  group('TodosController Test', () {
    late MockTodosUseCase mockTodosUseCase;
    late MockUuid mockUuid;
    late MockSnackBarMessenger mockSnackBarMessenger;
    late TodosController todosController;
    final currentDateTime = DateTime(2024, 4, 27);

    setUp(() {
      mockTodosUseCase = MockTodosUseCase();
      mockUuid = MockUuid();
      mockSnackBarMessenger = MockSnackBarMessenger();

      // Create a TodoController
      todosController = TodosController(
        todosUseCase: mockTodosUseCase,
        uuidGenerator: mockUuid,
        snackBarMessenger: mockSnackBarMessenger,
        currentDateTime: () => currentDateTime,
      );

      // Mocking the UUID generation
      when(mockUuid.v4()).thenReturn('mocked_uuid');
    });

    test('should initialize with empty todos', () async {
      // Mocking the behavior of TodosUsecase to return empty todos
      when(mockTodosUseCase.getTodos()).thenAnswer((_) async => []);

      // initialize with onInit
      Get.put(todosController);

      verify(mockTodosUseCase.getTodos()).called(1);
      expect(todosController.todos.length, 0);
    });

    test('should get todo list', () async {
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
          isCompleted: false,
          createdDate: currentDateTime,
        ),
      ];

      // Mocking the behavior of TodosUsecase to return a list of todos
      when(mockTodosUseCase.getTodos()).thenAnswer((_) async => todos);

      await todosController.getTodos();

      verify(mockTodosUseCase.getTodos()).called(1);
      expect(todosController.todos.length, 2);
      expect(todosController.todos[0].title, 'Test Todo 1');
      expect(todosController.todos[1].title, 'Test Todo 2');
    });

    test('should add todo', () async {
      final newTodo = Todo(
        id: 'mocked_uuid',
        title: 'New Todo',
        description: '',
        isCompleted: false,
        createdDate: currentDateTime,
      );

      // Mocking the behavior of TodosUsecase to return a list of todos
      when(mockTodosUseCase.getTodos()).thenAnswer((_) async => [newTodo]);

      await todosController.addTodo(title: 'New Todo');

      verify(todosController.uuidGenerator.v4()).called(1);
      verify(mockTodosUseCase.addTodo(newTodo)).called(1);
      verify(mockTodosUseCase.getTodos()).called(1);

      // TODO: call getTodos() inner function not working
      await todosController.getTodos();

      expect(todosController.todos.length, 1);
      expect(todosController.todos.last.title, 'New Todo');
    });

    test('should update todo', () async {
      final newTodo = Todo(
        id: '1',
        title: 'New Todo',
        description: '',
        isCompleted: false,
        createdDate: currentDateTime,
      );
      final updatedTodo = Todo(
        id: '1',
        title: 'Updated Todo',
        description: '',
        isCompleted: false,
        createdDate: currentDateTime,
      );

      // Mocking the behavior of TodosUsecase to return a list of todos
      when(mockTodosUseCase.getTodos()).thenAnswer((_) async => [updatedTodo]);

      await todosController.updateTodo(newTodo, title: 'Updated Todo');

      verify(mockTodosUseCase.updateTodo(updatedTodo)).called(1);
      verify(mockTodosUseCase.getTodos()).called(1);

      // check
      await todosController.getTodos();

      expect(todosController.todos.length, 1);
      expect(todosController.todos.last.title, 'Updated Todo');
    });

    test('should update todo status', () async {
      final todos = [
        Todo(
            id: '1',
            title: 'Test Todo 1',
            description: '',
            isCompleted: false,
            createdDate: currentDateTime),
        Todo(
            id: '2',
            title: 'Test Todo 2',
            description: '',
            isCompleted: true,
            createdDate: currentDateTime)
      ];

      // Mocking the behavior of TodosUsecase to return a list of todos
      when(mockTodosUseCase.getTodos()).thenAnswer((_) async => todos);

      await todosController.toggleTodoStatus(todos[1].id, true);

      verify(mockTodosUseCase.updateTodoStatus(todos[1].id, true)).called(1);
    });

    test('should delete todo', () async {
      final todos = [
        Todo(
          id: '2',
          title: 'Test Todo 2',
          description: '',
          isCompleted: false,
          createdDate: currentDateTime,
        ),
      ];

      // Mocking the behavior of TodosUsecase to return a list of todos
      when(mockTodosUseCase.getTodos()).thenAnswer((_) async => todos);

      await todosController.addTodo(title: 'Test Todo 1');
      await todosController.addTodo(title: 'Test Todo 2');
      await todosController.deleteTodo(Todo(
        id: '1',
        title: 'Test Todo 1',
        description: '',
        isCompleted: false,
        createdDate: currentDateTime,
      ));

      expect(todosController.todos.length, 1);
      expect(todosController.todos[0].title, 'Test Todo 2');
    });

    test('should update completed all todo list', () async {
      final completedTodos = [
        Todo(
            id: '1',
            title: 'Test Todo 1',
            description: '',
            isCompleted: true,
            createdDate: currentDateTime),
        Todo(
            id: '2',
            title: 'Test Todo 2',
            description: '',
            isCompleted: true,
            createdDate: currentDateTime)
      ];

      // Mocking the behavior of TodosUsecase to return a list of todos
      when(mockTodosUseCase.getTodos()).thenAnswer((_) async => completedTodos);

      // Mocking the behavior of TodosUsecase to return change completed status count
      when(mockTodosUseCase.toggleCompletedAll()).thenAnswer((_) async => 1);

      await todosController.addTodo(title: 'Test Todo 1');
      await todosController.addTodo(title: 'Test Todo 2');
      await todosController.toggleCompletedAll();

      verify(mockTodosUseCase.toggleCompletedAll()).called(1);
      expect(await mockTodosUseCase.toggleCompletedAll(), 1);
    });

    test('should clear/remove completed all todo list', () async {
      // Mocking the behavior of TodosUsecase to return a list of todos
      when(mockTodosUseCase.getTodos()).thenAnswer((_) async => []);

      // Mocking the behavior of TodosUsecase to return removed count
      when(mockTodosUseCase.clearCompleted()).thenAnswer((_) async => 2);

      await todosController.addTodo(title: 'Test Todo 1');
      await todosController.addTodo(title: 'Test Todo 2');
      await todosController.clearCompleted();

      verify(mockTodosUseCase.clearCompleted()).called(1);
      expect(await mockTodosUseCase.clearCompleted(), 2);
      expect(todosController.todos.length, 0);
    });

    test('should show SnackBar with message', () async {
      final deletedTodo = Todo(
        id: 'mocked_uuid',
        title: 'Test Todo 1',
        description: '',
        isCompleted: false,
        createdDate: currentDateTime,
      );

      todosController.showDeleteSnackBar(deletedTodo: deletedTodo);

      verify(mockSnackBarMessenger.showDeletedMessage(
        message: 'Todo "${deletedTodo.title}" deleted.',
        undo: anyNamed('undo'),
      )).called(1);
    });

    test('should undelete todo', () async {
      final deletedTodo = Todo(
        id: '1',
        title: 'Test Todo 1',
        description: '',
        isCompleted: false,
        createdDate: currentDateTime,
      );

      // Mocking the behavior of TodosUsecase to return a list of todos
      when(mockTodosUseCase.getTodos()).thenAnswer((_) async => [deletedTodo]);

      // Call the unDeleteTodo function
      await todosController.unDeleteTodo(deletedTodo);

      verify(mockTodosUseCase.addTodo(deletedTodo)).called(1);
    });
  });
}
