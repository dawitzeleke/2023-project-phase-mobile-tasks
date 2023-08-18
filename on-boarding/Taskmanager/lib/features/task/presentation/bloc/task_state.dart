
import 'package:equatable/equatable.dart';

import '../../../../taskModel.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object?> get props => [];
}

class TaskInitialState extends TaskState {}

class TaskLoadingState extends TaskState {}

class TaskSuccessState extends TaskState {
  final Task task;
  const TaskSuccessState({required this.task});

  @override
  List<Object?> get props => [task];
}

class TaskFailureState extends TaskState {
  final String error;

  const TaskFailureState({required this.error});
  @override
  List<Object?> get props => [error];
}