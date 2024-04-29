// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/domain/entities/todo.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/todos/widgets/todos_tile.dart';

void main() {
  final currentDateTime = DateTime(2024, 4, 27);

  group('TodosTile Widget Test', () {
    testWidgets('TodosTile default style', (WidgetTester tester) async {
      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: TodosTile(
              todo: Todo(
                id: '1',
                title: 'New Title',
                description: 'New Description',
                isCompleted: false,
                createdDate: currentDateTime,
              ),
              onToggleCompleted: (bool? value) {},
              onDismissed: (_) {},
              onTap: () {},
            ),
          ),
        ),
      );

      // Find the TodosTile widget by its key
      final listTileFinder = find.byKey(const Key('TodosTile_Dismissible_1'));

      // Verify that the TodosTile exists
      expect(listTileFinder, findsOneWidget);

      // Verify that the TodosTile contains the expected title text
      expect(find.text('New Title'), findsOneWidget);

      // Verify that the TodosTile contains the expected description text
      expect(find.text('New Description'), findsOneWidget);
    });

    testWidgets('TodosTile completed style', (WidgetTester tester) async {
      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: TodosTile(
              todo: Todo(
                id: '2',
                title: 'New Title',
                description: 'New Description',
                isCompleted: true,
                createdDate: currentDateTime,
              ),
              onToggleCompleted: (bool? value) {},
              onDismissed: (_) {},
              onTap: () {},
            ),
          ),
        ),
      );

      // Find the TodosTile widget by its key
      final listTileFinder = find.byKey(const Key('TodosTile_Dismissible_2'));

      // Verify that the TodosTile exists
      expect(listTileFinder, findsOneWidget);

      // Verify that the TodosTile contains the expected title text
      expect(find.text('New Title'), findsOneWidget);

      // Verify that the TodosTile contains the expected description text
      expect(find.text('New Description'), findsOneWidget);

      // Get the text widget's style
      final textWidget = tester.widget<Text>(find.text('New Title'));

      // Verify that the text decoration is lineThrough
      expect(textWidget.style!.decoration, TextDecoration.lineThrough);
    });
  });
}
