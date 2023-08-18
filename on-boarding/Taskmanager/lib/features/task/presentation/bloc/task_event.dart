
import 'package:equatable/equatable.dart';

import '../../../../taskModel.dart';

abstract class TaskEvent extends Equatable{
  @override
  List<Object?> get propes => [];
}

class AddTaskEvent extends TaskEvent {
  final Task task;
  AddTaskEvent({required this.task});

  @override
  List<Object?> get props => [task];
}

class EditTaskEvent extends TaskEvent {
  final Task task;
  EditTaskEvent({required this.task});

  @override
  List<Object?> get props => [task];
}

class DeleteTaskEvent extends TaskEvent {
  final Task task;
  DeleteTaskEvent({required this.task});

  @override
  List<Object?> get props => [task];
}

class MarkTaskDoneEvent extends TaskEvent {
  final bool done;
  MarkTaskDoneEvent({required this.done});

  @override
  List<Object?> get props => [done];
}
