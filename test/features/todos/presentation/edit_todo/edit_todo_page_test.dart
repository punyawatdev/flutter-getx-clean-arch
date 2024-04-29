// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/domain/entities/todo.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/edit_todo/controllers/edit_todo_controller.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/edit_todo/page/edit_todo_page.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/todos/controllers/todos_controller.dart';
import '../todos/todos_controller_test.mocks.dart';

void main() {
  late MockTodosUseCase mockTodosUseCase;
  late MockUuid mockUuid;
  late MockSnackBarMessenger mockSnackBarMessenger;
  late TodosController todosController;
  final currentDateTime = DateTime(2024, 4, 27);

  setUpAll(() {
    // Create Mocks
    mockTodosUseCase = MockTodosUseCase();
    mockUuid = MockUuid();
    mockSnackBarMessenger = MockSnackBarMessenger();

    // Create a TodosController
    todosController = TodosController(
      todosUseCase: mockTodosUseCase,
      uuidGenerator: mockUuid,
      snackBarMessenger: mockSnackBarMessenger,
      currentDateTime: () => currentDateTime,
    );

    // Mocking the UUID generation
    when(mockUuid.v4()).thenReturn('mocked_uuid');
  });

  group('EditTodoPage Test', () {
    testWidgets('should updating title and description with addTodo',
        (WidgetTester tester) async {
      // Mocking the behavior of TodosUsecase to return a list of todos.
      when(mockTodosUseCase.getTodos()).thenAnswer((_) async => []);

      // Initialize GetX bindings.
      Get.put(todosController);

      // Create an instance of EditTodoController.
      final editTodoController = Get.put(EditTodoController());

      // Build the widget and trigger a frame.
      await tester.pumpWidget(const GetMaterialApp(home: EditTodoPage()));

      // Enter text into the text field.
      await tester.enterText(
          find.byKey(const Key('EditTodoPage_Title_TextFormField')),
          'New Todo Title');
      await tester.enterText(
          find.byKey(const Key('EditTodoPage_Description_TextFormField')),
          'New Todo Description');

      // Tap the save button.
      await tester.tap(find
          .byKey(const Key('EditTodoPage_AddEditTodo_FloatingActionButton')));

      // Wait for the state to update.
      await tester.pump();

      // Verify that the title is updated in the controller.
      expect(editTodoController.titleEditingController.text, 'New Todo Title');
      expect(editTodoController.descEditingController.text,
          'New Todo Description');

      final newTodo = Todo(
        id: 'mocked_uuid',
        title: 'New Todo Title',
        description: 'New Todo Description',
        isCompleted: false,
        createdDate: currentDateTime,
      );

      // Verify that the mockTodosUseCase.addTodo is called.
      verify(mockTodosUseCase.addTodo(newTodo)).called(1);

      // Delete GetX Constants.
      Get.delete<EditTodoController>();
    });

    testWidgets('should updating title and description with editTodo',
        (WidgetTester tester) async {
      final newTodo = Todo(
        id: 'mocked_uuid',
        title: 'New Todo Title',
        description: 'New Todo Description',
        isCompleted: false,
        createdDate: currentDateTime,
      );

      // Mocking the behavior of TodosUsecase to return a list of todos.
      when(mockTodosUseCase.getTodos()).thenAnswer((_) async => [newTodo]);

      // Initialize GetX bindings.
      Get.put(todosController);

      // Create an instance of EditTodoController.
      final editTodoController =
          Get.put(EditTodoController(initialTodo: newTodo));

      // Build the widget and trigger a frame.
      await tester
          .pumpWidget(GetMaterialApp(home: EditTodoPage(initialTodo: newTodo)));

      // Verify that the edit page is loaded.
      expect(find.text('Edit Todo'), findsOneWidget);

      // Enter text into the text field.
      await tester.enterText(
          find.byKey(const Key('EditTodoPage_Title_TextFormField')),
          'Updated Todo Title');
      await tester.enterText(
          find.byKey(const Key('EditTodoPage_Description_TextFormField')),
          'Updated Todo Description');

      // Tap the save button.
      await tester.tap(find
          .byKey(const Key('EditTodoPage_AddEditTodo_FloatingActionButton')));

      // Wait for the state to update.
      await tester.pump();

      // Verify that the title is updated in the controller.
      expect(
          editTodoController.titleEditingController.text, 'Updated Todo Title');
      expect(editTodoController.descEditingController.text,
          'Updated Todo Description');

      final updatedTodo = Todo(
        id: 'mocked_uuid',
        title: 'Updated Todo Title',
        description: 'Updated Todo Description',
        isCompleted: false,
        createdDate: currentDateTime,
      );

      // Verify that the mockTodosUseCase.addTodo is called.
      verify(mockTodosUseCase.updateTodo(updatedTodo)).called(1);

      // Delete GetX Constants.
      Get.delete<EditTodoController>();
    });
  });
}
