// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/presentation/todos/controllers/todos_controller.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/todos/page/todos_page.dart';
import 'todos_controller_test.mocks.dart';

void main() {
  group('Todos Page Test', () {
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
        currentDateTime: () => currentDateTime,
        snackBarMessenger: mockSnackBarMessenger,
      );

      // Mocking the UUID generation
      when(mockUuid.v4()).thenReturn('mocked_uuid');
    });

    testWidgets('should display todos', (WidgetTester tester) async {
      // Mocking the behavior of TodosUsecase to return a list of todos
      when(mockTodosUseCase.getTodos()).thenAnswer((_) async => []);

      // Initialize GetX bindings
      Get.put(todosController);

      // Build our widget
      await tester.pumpWidget(const GetMaterialApp(home: TodosPage()));

      // Expect to find the text "Todos"
      expect(find.text('Flutter Todos'), findsOneWidget);
    });
  });
}
