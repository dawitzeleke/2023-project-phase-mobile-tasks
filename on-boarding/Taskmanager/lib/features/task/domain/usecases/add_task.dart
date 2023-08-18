
import 'package:add_task/features/task/domain/entities/task_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repository/task_repository.dart';

class AddTask {
  final TaskRepository taskRepository;
  final TaskEntity task;
  
  AddTask({required this.taskRepository, required this.task});
  
  Future<Either<Failure, TaskEntity>> call() async {
    return await taskRepository.addTask(task);
  }
}