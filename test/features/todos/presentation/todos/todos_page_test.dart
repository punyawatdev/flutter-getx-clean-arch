// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/domain/entities/todo.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/todos/controllers/todos_controller.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/todos/page/todos_page.dart';
import 'todos_controller_test.mocks.dart';

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

    // Mocking the UUID generation
    when(mockUuid.v4()).thenReturn('mocked_uuid');
  });

  group('TodosPage Test', () {
    testWidgets('should display todos page', (WidgetTester tester) async {
      // Mocking the behavior of TodosUsecase to return a list of todos.
      when(mockTodosUseCase.getTodos()).thenAnswer((_) async => []);

      // Initialize GetX bindings
      Get.testMode = true;
      Get.put(TodosController(
        todosUseCase: mockTodosUseCase,
        uuidGenerator: mockUuid,
        currentDateTime: () => currentDateTime,
        snackBarMessenger: mockSnackBarMessenger,
      ));

      // Build our widget.
      await tester.pumpWidget(const GetMaterialApp(home: TodosPage()));

      // Expect to find the text "Flutter Todos".
      expect(find.text('Flutter Todos'), findsOneWidget);
    });

    testWidgets('should display todos list', (WidgetTester tester) async {
      final mockTodos = [
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
        )
      ];

      // Mocking the behavior of TodosUsecase to return a list of todos.
      when(mockTodosUseCase.getTodos()).thenAnswer((_) async => mockTodos);

      // Get TodosController
      final todosController = Get.find<TodosController>();

      // Re-Update mock data.
      await todosController.getTodos();

      // Build our widget.
      await tester.pumpWidget(const GetMaterialApp(home: TodosPage()));
      await tester.pump();

      // Expect to find the item on screen.
      expect(find.text('Test Todo 1'), findsOneWidget);
      expect(find.text('Test Todo 2'), findsOneWidget);
    });

    testWidgets('should edit todo', (WidgetTester tester) async {
      // Key constants
      const titleField = Key('EditTodoPage_Title_TextFormField');
      const descField = Key('EditTodoPage_Description_TextFormField');
      const saveTodoButton =
          Key('EditTodoPage_AddEditTodo_FloatingActionButton');

      // Build our widget.
      await tester.pumpWidget(const GetMaterialApp(home: TodosPage()));

      // Expect to find the item on screen.
      expect(find.text('Test Todo 1'), findsOneWidget);
      expect(find.text('Test Todo 2'), findsOneWidget);

      // Tap the add button to add todo.
      await tester.tap(find.text('Test Todo 1'));
      await tester.pumpAndSettle();

      // Expect to find the editTodo page.
      expect(find.text('Edit Todo'), findsOneWidget);

      // Enter 'UpdatedTodo 1' into the TextField.
      await tester.enterText(find.byKey(titleField), 'Updated Todo 1');
      await tester.enterText(find.byKey(descField), 'Hi, Updated!!!');

      // Tap the add button to save.
      await tester.tap(find.byKey(saveTodoButton));

      // Verify updateTodo is called.
      verify(
        mockTodosUseCase.updateTodo(
          Todo(
            id: '1',
            title: 'Updated Todo 1',
            description: 'Hi, Updated!!!',
            isCompleted: false,
            createdDate: currentDateTime,
          ),
        ),
      ).called(1);

      final mockUpdatedTodos = [
        Todo(
          id: '1',
          title: 'Updated Todo 1',
          description: 'Hi, Updated!!!',
          isCompleted: false,
          createdDate: currentDateTime,
        ),
        Todo(
          id: '2',
          title: 'Test Todo 2',
          description: '',
          isCompleted: false,
          createdDate: currentDateTime,
        )
      ];
      // Mocking the behavior of TodosUsecase to return a list of todos.
      when(mockTodosUseCase.getTodos())
          .thenAnswer((_) async => mockUpdatedTodos);

      final todosController = Get.find<TodosController>();

      // Re-Update mock data.
      await todosController.getTodos();

      // Rebuild the widget and wait for animation to complete.
      await tester.pumpAndSettle();

      // Expect to find the item updated on screen.
      expect(find.text('Updated Todo 1'), findsOneWidget);
      expect(find.text('Test Todo 1'), findsNothing);
      expect(find.text('Test Todo 2'), findsOneWidget);
    });

    testWidgets('should checkbox complete todo', (WidgetTester tester) async {
      // Key constants
      const checkboxTodo1 = Key('TodosTile_Checkbox_1');

      // Build our widget.
      await tester.pumpWidget(const GetMaterialApp(home: TodosPage()));

      // Expect to find the item on screen.
      expect(find.text('Updated Todo 1'), findsOneWidget);
      expect(find.text('Test Todo 2'), findsOneWidget);

      // Tap the add button to add todo.
      await tester.tap(find.byKey(checkboxTodo1));
      await tester.pump();

      // Verify updateTodoStatus is called.
      verify(mockTodosUseCase.updateTodoStatus('1', true)).called(1);

      final mockUpdatedTodos = [
        Todo(
          id: '1',
          title: 'Updated Todo 1',
          description: 'Hi, Updated!!!',
          isCompleted: true,
          createdDate: currentDateTime,
        ),
        Todo(
          id: '2',
          title: 'Test Todo 2',
          description: '',
          isCompleted: false,
          createdDate: currentDateTime,
        )
      ];
      // Mocking the behavior of TodosUsecase to return a list of todos.
      when(mockTodosUseCase.getTodos())
          .thenAnswer((_) async => mockUpdatedTodos);

      final todosController = Get.find<TodosController>();

      // Re-Update mock data.
      await todosController.getTodos();

      // Rebuild the widget
      await tester.pump();

      // Expect to find the item updated on screen.
      expect(find.text('Updated Todo 1'), findsOneWidget);

      // Get the text widget's style
      final textWidget = tester.widget<Text>(find.text('Updated Todo 1'));

      // Verify that the text decoration is lineThrough
      expect(textWidget.style!.decoration, TextDecoration.lineThrough);
    });

    testWidgets('should remove todo', (WidgetTester tester) async {
      // Build our widget.
      await tester.pumpWidget(const GetMaterialApp(home: TodosPage()));
      await tester.pump();

      // Expect to find the item on screen.
      expect(find.text('Test Todo 2'), findsOneWidget);

      // Swipe the item to dismiss it.
      await tester.drag(find.text('Updated Todo 1'), const Offset(500, 0),
          warnIfMissed: false);

      // Call delete
      final todosController = Get.find<TodosController>();
      todosController.deleteTodo(
        Todo(
          id: '2',
          title: 'Test Todo 2',
          description: '',
          isCompleted: false,
          createdDate: currentDateTime,
        ),
      );

      final mockUpdatedTodos = [
        Todo(
          id: '1',
          title: 'Updated Todo 1',
          description: 'Hi, Updated!!!',
          isCompleted: true,
          createdDate: currentDateTime,
        ),
      ];
      // Mocking the behavior of TodosUsecase to return a list of todos.
      when(mockTodosUseCase.getTodos())
          .thenAnswer((_) async => mockUpdatedTodos);

      // Build the widget until the dismiss animation ends.
      await tester.pumpAndSettle();

      // Verify deleteTodo is called.
      verify(mockTodosUseCase.deleteTodo('2')).called(1);

      // Ensure that the item is no longer on screen.
      expect(find.text('Updated Todo 1'), findsOneWidget);
      expect(find.text('Test Todo 2'), findsNothing);

      // Delete GetX Instance<S>.
      Get.delete<TodosController>();
    });
  });

  group('TodosPage Filter/Options Test', () {
    testWidgets('should filter todos view by All/Active Only/Completed Only',
        (WidgetTester tester) async {
      // Key constants
      const todosFilterButton = Key('TodosPage_TodosFilterButton');
      const todosFilterAll = Key('TodosFilterButton_All');
      const todosFilterActiveOnly = Key('TodosFilterButton_ActiveOnly');
      const todosFilterCompletedOnly = Key('TodosFilterButton_CompletedOnly');

      final mockTodos = [
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
        )
      ];
      // Mocking the behavior of TodosUsecase to return a list of todos.
      when(mockTodosUseCase.getTodos()).thenAnswer((_) async => mockTodos);

      // Initialize GetX bindings
      Get.testMode = true;
      Get.put(TodosController(
        todosUseCase: mockTodosUseCase,
        uuidGenerator: mockUuid,
        currentDateTime: () => currentDateTime,
        snackBarMessenger: mockSnackBarMessenger,
      ));

      // Build our widget.
      await tester.pumpWidget(const GetMaterialApp(home: TodosPage()));

      // Tab a TodosFilterButton widget.
      await tester.tap(find.byKey(todosFilterButton), warnIfMissed: false);
      await tester.pumpAndSettle();

      // Tab a activeOnly filter item.
      await tester.tap(find.byKey(todosFilterActiveOnly), warnIfMissed: false);
      await tester.pumpAndSettle();

      // Expect to find the item is filter type "Active Only" on screen.
      // Expect result is "Test Todo 1"
      expect(find.text('Test Todo 1'), findsOneWidget);
      expect(find.text('Test Todo 2'), findsNothing);

      // Tab a TodosFilterButton widget.
      await tester.tap(find.byKey(todosFilterButton), warnIfMissed: false);
      await tester.pumpAndSettle();

      // Tab a CompletedOnly filter item.
      await tester.tap(find.byKey(todosFilterCompletedOnly),
          warnIfMissed: false);
      await tester.pumpAndSettle();

      // Expect to find the item is filter type "Completed Only" on screen.
      // Expect result is "Test Todo 2"
      expect(find.text('Test Todo 1'), findsNothing);
      expect(find.text('Test Todo 2'), findsOneWidget);

      // Tab a TodosFilterButton widget.
      await tester.tap(find.byKey(todosFilterButton), warnIfMissed: false);
      await tester.pumpAndSettle();

      // Tab a All filter item.
      await tester.tap(find.byKey(todosFilterAll), warnIfMissed: false);
      await tester.pumpAndSettle();

      // Expect to find the item is filter type "All" on screen.
      expect(find.text('Test Todo 1'), findsOneWidget);
      expect(find.text('Test Todo 2'), findsOneWidget);

      // Delete GetX Instance<S>.
      Get.delete<TodosController>();
    });

    testWidgets('should option todos by Mark All as completed/Clear completed',
        (WidgetTester tester) async {
      // Key constants
      const todosOptionsButton = Key('TodosPage_TodosOptionsButton');
      const todosOptionsAll = Key('TodosOptionsButton_ToggleAll');
      const todosOptionsClear = Key('TodosOptionsButton_ClearCompleted');

      final mockTodos = [
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
        )
      ];
      // Mocking the behavior of TodosUsecase to return a list of todos.
      when(mockTodosUseCase.getTodos()).thenAnswer((_) async => mockTodos);

      // Mocking the behavior of TodosUsecase to toggleCompletedAll.
      when(mockTodosUseCase.toggleCompletedAll()).thenAnswer((_) async => 1);

      // Mocking the behavior of TodosUsecase to clearCompleted.
      when(mockTodosUseCase.clearCompleted()).thenAnswer((_) async => 2);

      // Initialize GetX bindings
      Get.testMode = true;
      final todosController = Get.put(TodosController(
        todosUseCase: mockTodosUseCase,
        uuidGenerator: mockUuid,
        currentDateTime: () => currentDateTime,
        snackBarMessenger: mockSnackBarMessenger,
      ));

      // Build our widget.
      await tester.pumpWidget(const GetMaterialApp(home: TodosPage()));

      // Tab a TodosOptionsButton widget.
      await tester.tap(find.byKey(todosOptionsButton), warnIfMissed: false);
      await tester.pumpAndSettle();

      final mockUpdateTodos = [
        Todo(
          id: '1',
          title: 'Test Todo 1',
          description: '',
          isCompleted: true,
          createdDate: currentDateTime,
        ),
        Todo(
          id: '2',
          title: 'Test Todo 2',
          description: '',
          isCompleted: true,
          createdDate: currentDateTime,
        )
      ];
      // Mocking the behavior of TodosUsecase to return a list of todos.
      when(mockTodosUseCase.getTodos())
          .thenAnswer((_) async => mockUpdateTodos);

      // Tab a "Mark All as completed" item.
      await tester.tap(find.byKey(todosOptionsAll), warnIfMissed: false);
      await tester.pumpAndSettle();

      // Expect to find the item is all completed on screen.
      verify(mockTodosUseCase.toggleCompletedAll()).called(1);
      expect(todosController.todos.first.isCompleted, true);
      expect(todosController.todos.last.isCompleted, true);

      // Tab a TodosOptionsButton widget.
      await tester.tap(find.byKey(todosOptionsButton), warnIfMissed: false);
      await tester.pumpAndSettle();

      // Mocking the behavior of TodosUsecase to return a list of todos.
      when(mockTodosUseCase.getTodos()).thenAnswer((_) async => []);

      // Tab a "ClearCompleted" item.
      await tester.tap(find.byKey(todosOptionsClear), warnIfMissed: false);
      await tester.pumpAndSettle();

      // Expect to find the item is clear completed on screen.
      expect(find.text('Test Todo 1'), findsNothing);
      expect(find.text('Test Todo 2'), findsNothing);

      // Delete GetX Instance<S>.
      Get.delete<TodosController>();
    });
  });
}
