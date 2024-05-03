// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/presentation/todos/widgets/todos_options_button.dart';

void main() {
  group('TodosOptionsButton Widget Test', () {
    testWidgets('TodosOptionsButton displays menu options',
        (WidgetTester tester) async {
      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: const Text('TodosOptionsButton Test'),
              actions: [
                TodosOptionsButton(
                  onSelected: (TodosViewOption value) {},
                ),
              ],
            ),
          ),
        ),
      );

      // Verify that PopupMenuButton is initially closed.
      expect(find.byIcon(Icons.more_vert_rounded), findsOneWidget);
      expect(find.text('Mark All as completed'), findsNothing);
      expect(find.text('Clear completed'), findsNothing);

      // Open the TodosFilterButton.
      await tester.tap(find.byType(PopupMenuButton<TodosViewOption>));
      await tester.pumpAndSettle();

      // Verify that menu options are displayed.
      expect(find.text('Mark All as completed'), findsOneWidget);
      expect(find.text('Clear completed'), findsOneWidget);
    });

    testWidgets('TodosOptionsButton disabled does not react to touches',
        (WidgetTester tester) async {
      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: const Text('TodosOptionsButton Test'),
              actions: [
                TodosOptionsButton(
                  hasTodos: false,
                  hasCompletedTodos: false,
                  onSelected: (TodosViewOption value) {},
                ),
              ],
            ),
          ),
        ),
      );

      // Verify that PopupMenuButton is initially closed.
      expect(find.byIcon(Icons.more_vert_rounded), findsOneWidget);
      expect(find.text('Mark All as completed'), findsNothing);
      expect(find.text('Clear completed'), findsNothing);

      // Open the TodosFilterButton.
      await tester.tap(find.byType(PopupMenuButton<TodosViewOption>));
      await tester.pumpAndSettle();

      // Ensure that the PopupMenuItem with enabled: false is not selectable.
      await tester.tap(find
          .text('Mark All as completed')); // Try to tap on the disabled item.
      await tester.pumpAndSettle(); // Wait for the frame to complete.

      // Verify that no change has happened after tapping the disabled item.
      expect(find.text('Mark All as completed'), findsOneWidget);
      expect(find.text('Clear completed'), findsOneWidget);
    });

    testWidgets('TodosOptionsButton options is enabled',
        (WidgetTester tester) async {
      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: const Text('TodosOptionsButton Test'),
              actions: [
                TodosOptionsButton(
                  hasTodos: true,
                  hasCompletedTodos: true,
                  onSelected: (TodosViewOption value) {},
                ),
              ],
            ),
          ),
        ),
      );

      // Verify that PopupMenuButton is initially closed.
      expect(find.byIcon(Icons.more_vert_rounded), findsOneWidget);
      expect(find.text('Mark All as completed'), findsNothing);
      expect(find.text('Clear completed'), findsNothing);

      // Open the TodosFilterButton.
      await tester.tap(find.byType(PopupMenuButton<TodosViewOption>));
      await tester.pumpAndSettle();

      // Ensure that the PopupMenuItem with enabled: true is not selectable.
      await tester.tap(find
          .text('Mark All as completed')); // Try to tap on the enabled item.
      await tester.pumpAndSettle(); // Wait for the frame to complete.

      // Verify that change has happened after tapping the enabled item.
      expect(find.byIcon(Icons.more_vert_rounded), findsOneWidget);
      expect(find.text('Mark All as completed'), findsNothing);
      expect(find.text('Clear completed'), findsNothing);
    });
  });
}
