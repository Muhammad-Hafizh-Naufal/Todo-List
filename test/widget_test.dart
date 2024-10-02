import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:TodoApp/main.dart';

void main() {
  testWidgets('Adding a new todo item', (WidgetTester tester) async {
    // Build the TodoApp and trigger a frame.
    await tester.pumpWidget(const TodoApp());

    // Verify initial state, no todos should be present.
    expect(find.text('Add a new task'), findsOneWidget);
    expect(find.text('What\'s up!'), findsOneWidget);
    expect(find.text('tasks pending'), findsOneWidget);

    // Enter text into the TextField to add a new todo.
    await tester.enterText(find.byType(TextField), 'New Task');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify the new todo is added.
    expect(find.text('New Task'), findsOneWidget);
  });
}
