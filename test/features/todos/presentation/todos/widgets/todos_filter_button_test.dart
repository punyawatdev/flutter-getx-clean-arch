// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/presentation/todos/widgets/todos_filter_button.dart';

void main() {
  group('TodosFilterButton Widget Test', () {
    testWidgets('TodosFilterButton displays menu options',
        (WidgetTester tester) async {
      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: const Text('TodosFilterButton Test'),
              // Create a PopupMenuButton with some menu items
              actions: [
                TodosFilterButton(
                  initialValue: TodosViewFilter.all,
                  onSelected: (TodosViewFilter value) {},
                ),
              ],
            ),
          ),
        ),
      );

      // Verify that PopupMenuButton is initially closed
      expect(find.byIcon(Icons.filter_list), findsOneWidget);
      expect(find.text('All'), findsNothing);
      expect(find.text('Active Only'), findsNothing);
      expect(find.text('Completed Only'), findsNothing);

      // Open the TodosFilterButton
      await tester.tap(find.byType(PopupMenuButton<TodosViewFilter>));
      await tester.pumpAndSettle();

      // Verify that menu options are displayed
      expect(find.text('All'), findsOneWidget);
      expect(find.text('Active Only'), findsOneWidget);
      expect(find.text('Completed Only'), findsOneWidget);

      // Tap on one of the menu options
      await tester.tap(find.text('Completed Only'));
      await tester.pumpAndSettle();

      // Verify that the correct option is selected
      expect(find.text('All'), findsNothing);
      expect(find.text('Active Only'), findsNothing);
      expect(find.text('Completed Only'), findsNothing);
    });
  });
}
