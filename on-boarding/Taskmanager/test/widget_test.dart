// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:add_task/addTask.dart';
import 'package:add_task/controller/controller.dart';
import 'package:add_task/onboarding.dart';
import 'package:add_task/todoList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:add_task/main.dart';

void main() {

  testWidgets('Button Navigates to Todolist Page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: OnBoardingPage(),
    ));
    final Finder buttonFinder = find.text("Get Started");

    await tester.tap(buttonFinder);
    await tester.pumpAndSettle();

    expect(find.text('Todo List'), findsOneWidget);
  });

  testWidgets(
  'widget test to verify that new tasks can be created correctly',
  (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AddTask(),
      ),
    );

    TaskController taskController = TaskController();
    final textField1Finder = find.byKey(Key('textfield1'));
    await tester.pump();
    final textField2Finder = find.byKey(Key('textfield2'));
    await tester.pump();
    final textField3Finder = find.byKey(Key('textfield3'));
    await tester.pump();

    await tester.enterText(textField1Finder, 'Input 1');
    await tester.pump();
    await tester.enterText(textField2Finder, 'Input 2');
    await tester.pump();
    await tester.enterText(textField3Finder, 'Input 3');
    await tester.pump();

    final Finder addbuttonFinder = find.text("Add task");


    await tester.tap(addbuttonFinder);
    await tester.pumpAndSettle();

    expect(taskController.taskManager.taskList.length, 5);
    },
);

testWidgets(
  'test the behavior of adding new tasks with empty task names',
  (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AddTask(),
      ),
    );

    TaskController taskController = TaskController();
    final textField1Finder = find.byKey(Key('textfield1'));
    await tester.pump();
    final textField2Finder = find.byKey(Key('textfield2'));
    await tester.pump();
    final textField3Finder = find.byKey(Key('textfield3'));
    await tester.pump();

    await tester.enterText(textField1Finder, '');
    await tester.pump();
    await tester.enterText(textField2Finder, '');
    await tester.pump();
    await tester.enterText(textField3Finder, '');
    await tester.pump();

    final Finder addbuttonFinder = find.text("Add task");


    await tester.tap(addbuttonFinder);
    await tester.pumpAndSettle();

    expect(taskController.taskManager.taskList.length, 4);
    },
);

}
