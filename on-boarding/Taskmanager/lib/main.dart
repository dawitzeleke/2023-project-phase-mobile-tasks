import 'package:add_task/taskDetailPage.dart';
import 'package:add_task/todoList.dart';
import 'package:flutter/material.dart';
import 'addTask.dart';
import 'onboarding.dart';
void main() {
  runApp(
    MyApp()
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnBoardingPage(),
    );
  }
}

