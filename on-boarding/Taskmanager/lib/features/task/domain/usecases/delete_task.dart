import 'package:add_task/core/error/failure.dart';
import 'package:add_task/features/task/domain/entities/task_entity.dart';
import 'package:add_task/features/task/domain/repository/task_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteTask {
  final TaskRepository repository;
  final String taskId;

  DeleteTask({required this.repository, required this.taskId});

  Future<Either<Failure, TaskEntity>> call() async {
    return await repository.deleteTask(taskId);
  }
}