// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable{
    String id;
   String title;
   String description;
   String dueDate;
   bool status;

  TaskEntity(
      {
        required this.id,
        required this.title,
      required this.description,
      required this.dueDate,
      required this.status}): super();

  @override
  List<Object> get props => [id];
}