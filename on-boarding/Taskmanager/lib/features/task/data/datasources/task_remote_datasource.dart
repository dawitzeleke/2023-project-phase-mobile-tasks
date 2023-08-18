import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:add_task/features/task/data/models/task_model.dart';
import 'package:add_task/features/task/domain/entities/task_entity.dart';

import '../../../../core/error/exceptions.dart';

abstract class TaskRemoteDatasource {
  Future<TaskModel> addTask(TaskEntity task);
  Future<TaskModel> editTask(TaskEntity task);
  Future<TaskModel> deleteTask(String taskId);
  Future<TaskModel> markTaskAsDone(String taskId, bool done);
}

class TaskRemoteDatasourceImpl implements TaskRemoteDatasource {
  final http.Client client;
  final uriString = '';
  TaskRemoteDatasourceImpl({required this.client});
  
  @override
  Future<TaskModel> addTask(TaskEntity task) async {
    final taskModel = TaskModel(id: task.id, title: task.title, description: task.description, dueDate: task.dueDate, status: task.status,);
    final jsonBody = json.encode(taskModel.toJson());
    final response = await client.post(
      Uri.parse('${uriString}postArticle'),
      body: jsonBody,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return TaskModel.fromJson(jsonResponse);
    } else {
      throw ServerException();
    }
  }
  
  @override
  Future<TaskModel> deleteTask(String taskId) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }
  
  @override
  Future<TaskModel> editTask(TaskEntity task) {
    // TODO: implement editTask
    throw UnimplementedError();
  }
  
  @override
  Future<TaskModel> markTaskAsDone(String taskId, bool done) {
    // TODO: implement markTaskAsDone
    throw UnimplementedError();
  }


}