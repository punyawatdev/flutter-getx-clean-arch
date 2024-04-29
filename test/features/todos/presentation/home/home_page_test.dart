// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/presentation/home/controllers/home_controller.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/home/page/home_page.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/stats/controllers/stats_controller.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/todos/controllers/todos_controller.dart';
import '../todos/todos_controller_test.mocks.dart';

void main() {
  late MockTodosUseCase mockTodosUseCase;
  late MockUuid mockUuid;
  late MockSnackBarMessenger mockSnackBarMessenger;
  late HomeController homeController;
  late TodosController todosController;
  late StatsController statsController;
  final currentDateTime = DateTime(2024, 4, 27);

  setUpAll(() {
    // Create Mocks
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
    // Create a HomeController
    homeController = HomeController();
    // Create a StatsController
    statsController = StatsController(todosUseCase: mockTodosUseCase);

    // Mocking the UUID generation
    when(mockUuid.v4()).thenReturn('mocked_uuid');
  });

  group('HomePage Test', () {
    testWidgets('should display home with bottom navigation bar',
        (WidgetTester tester) async {
      // Mocking the behavior of TodosUsecase to return a list of todos.
      when(mockTodosUseCase.getTodos()).thenAnswer((_) async => []);

      // Initialize GetX bindings.
      Get.put(homeController);
      Get.put(todosController);
      Get.put(statsController);

      // Build our app and trigger a frame.
      await tester.pumpWidget(const GetMaterialApp(home: HomePage()));

      // Verify that the initial page is loaded.
      expect(find.text('Flutter Todos'), findsOneWidget);

      // Expect to find the text on bottom navigation bar.
      expect(find.text('Todo List'), findsOneWidget);
      expect(find.text('Stats'), findsOneWidget);

      // Tap on the second item in the bottom navigation bar.
      await tester.tap(find.byIcon(Icons.show_chart));
      await tester.pumpAndSettle(); // Wait for animation to complete.

      // Verify that the correct page is loaded after tapping the second item.
      expect(find.text('Stats'), findsNWidgets(2));
      // Correctly expected are 2 widgets on the top and bottom bars.
    });

    testWidgets('should display add / remove todo',
        (WidgetTester tester) async {
      const openAddTodoPage = Key('HomePage_AddTodo_FloatingActionButton');
      const addTitleField = Key('EditTodoPage_Title_TextFormField');
      const addTodoButton =
          Key('EditTodoPage_AddEditTodo_FloatingActionButton');

      // Build our widget
      await tester.pumpWidget(const GetMaterialApp(home: HomePage()));

      // Tap the add button.
      await tester.tap(find.byKey(openAddTodoPage));
      await tester.pumpAndSettle();

      // Expect to find the add page.
      expect(find.text('Add Todo'), findsOneWidget);

      // Enter 'hi' into the TextField.
      await tester.enterText(find.byKey(addTitleField), 'Hi');

      // Tap the add button to add todo.
      await tester.tap(find.byKey(addTodoButton));

      // Rebuild the widget with the new item.
      await tester.pump();

      // Expect to find the item on screen.
      expect(find.text('Hi'), findsOneWidget);

      // Swipe the item to dismiss it.
      await tester.drag(find.text('Hi'), const Offset(500, 0),
          warnIfMissed: false);

      // Build the widget until the dismiss animation ends.
      await tester.pumpAndSettle();

      // Ensure that the item is no longer on screen.
      expect(find.text('Hi'), findsNothing);
    });
  });
}
