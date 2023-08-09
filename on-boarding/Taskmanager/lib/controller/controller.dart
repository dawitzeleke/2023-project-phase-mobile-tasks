
import 'package:add_task/taskManager.dart';
import 'package:flutter/foundation.dart';

class TaskController{
  static final TaskController instance = TaskController._internal();

  factory TaskController(){
    return instance;
  }

  TaskController._internal();

  TaskManager taskManager = TaskManager();

}