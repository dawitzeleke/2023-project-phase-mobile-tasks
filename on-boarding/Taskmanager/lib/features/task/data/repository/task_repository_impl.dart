

import 'package:add_task/core/error/exceptions.dart';
import 'package:add_task/core/error/failure.dart';
import 'package:add_task/features/task/domain/entities/task_entity.dart';
import 'package:add_task/features/task/domain/repository/task_repository.dart';
import 'package:dartz/dartz.dart';

import '../datasources/task_remote_datasource.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDatasource remoteDataSource;

  TaskRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, TaskEntity>> addTask(TaskEntity task) async{
    try {
      final createdTask = await remoteDataSource.addTask(task);
      return Right(createdTask);
    } on ServerException {
      throw ServerException(); 
    }
  }

  @override
  Future<Either<Failure, TaskEntity>> deleteTask(String taskId) async {
    try {
      final deletedTask = await remoteDataSource.deleteTask(taskId);
      return Right(deletedTask);
    } on ServerException {
      throw ServerException(); 
    }
  }

  @override
  Future<Either<Failure, TaskEntity>> editTask(TaskEntity task) async{
    try {
      final editedTask = await remoteDataSource.editTask(task);
      return Right(editedTask);
    } on ServerException {
      throw ServerException(); 
    }
  }

  @override
  Future<Either<Failure, TaskEntity>> markTaskAsDone(String taskId, bool done) {
    
  }

}