import 'package:flutter/material.dart';
import 'package:flutter_new_proj/screens/todo_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_proj/bloc/todo_bloc.dart';


void main() {
  testWidgets('adds a todo item and displays it', (WidgetTester tester) async {
    // Arrange: create the TodoBloc and pump the widget
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<TodoBloc>(
          create: (_) => TodoBloc(),
          child: TodoPage(),
        ),
      ),
    );

    // Expect initial state: No Task Added
    expect(find.text('No Task Added'), findsOneWidget);

    // Act: enter text and press add button
    final textFieldFinder = find.byType(TextField);
    final addButtonFinder = find.byIcon(Icons.add);

    await tester.enterText(textFieldFinder, 'Test Task');
    await tester.tap(addButtonFinder);
    await tester.pump(); // rebuild after state change

    // Assert: Task appears in the list
    expect(find.text('Test Task'), findsOneWidget);
    expect(find.text('No Task Added'), findsNothing);
  });
}
