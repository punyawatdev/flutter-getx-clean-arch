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

  group('EditTodoController Test', () {
    testWidgets('submitted a todo', (WidgetTester tester) async {
      // Mocking the behavior of TodosUsecase to return a list of todos.
      when(mockTodosUseCase.getTodos()).thenAnswer((_) async => []);

      // Initialize GetX bindings.
      Get.testMode = true;
      Get.put(todosController);

      // Create an instance of EditTodoController.
      final editTodoController = Get.put(EditTodoController());

      // Build the widget and trigger a frame.
      await tester.pumpWidget(const GetMaterialApp(home: EditTodoPage()));

      // Enter text into the text field.
      await tester.enterText(
          find.byKey(const Key('EditTodoPage_Title_TextFormField')),
          'New Todo Title');

      // Calling onSubmitted.
      editTodoController.onSubmitted();

      final newTodo = Todo(
        id: 'mocked_uuid',
        title: 'New Todo Title',
        description: '',
        isCompleted: false,
        createdDate: currentDateTime,
      );

      // Verify that the addTodo is called
      verify(mockTodosUseCase.addTodo(newTodo)).called(1);
    });

    test('validator should show error message', () async {
      // Create an instance of EditTodoController.
      final controller = Get.put(EditTodoController());

      // Validator TextFormField not null.
      final valueIsEmpty = controller.validator('');
      final valueIsValid = controller.validator('value');

      // Verify that the validate throw error message.
      expect(valueIsEmpty, 'Please this field must be filled');
      // Verify that the value is valid.
      expect(valueIsValid, null);
    });
  });
}
