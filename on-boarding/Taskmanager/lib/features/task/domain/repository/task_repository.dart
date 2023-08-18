
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/task_entity.dart';
abstract class TaskRepository {
 Future<Either<Failure, TaskEntity>> editTask(TaskEntity task);
 Future<Either<Failure, TaskEntity>> deleteTask(String taskId);
 Future<Either<Failure, TaskEntity>> addTask(TaskEntity task);
 Future<Either<Failure, TaskEntity>> markTaskAsDone(String taskId, bool done);
}