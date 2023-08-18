import 'package:add_task/features/task/domain/entities/task_entity.dart';
import 'package:equatable/equatable.dart';

class TaskModel extends TaskEntity {
  TaskModel ({
  required String id,
   required String title,
   required String description,
   required String dueDate,
   required bool status
  }) : super(
    id: id,
    title: title,
    description: description,
    dueDate: dueDate,
    status: status
  );

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(id: json['id'], title: json['title'], description: json['description'], dueDate: json['dueDate'], status: json['status'],);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dueDate' : dueDate,
      'status': status
    };
  }
}
