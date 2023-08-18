import 'package:add_task/features/task/domain/entities/task_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:add_task/features/task/domain/repository/task_repository.dart';
import '../../../../core/error/failure.dart';

class EditTask{
  final TaskRepository repository;
  final TaskEntity task;
  EditTask({ required this.repository, required this.task});

  Future<Either<Failure, TaskEntity>> call() async{
    return await repository.editTask(task);
  }
}