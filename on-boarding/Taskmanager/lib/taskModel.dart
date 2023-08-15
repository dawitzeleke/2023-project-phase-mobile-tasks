import 'package:equatable/equatable.dart';

class Task extends Equatable{
  final String id;
   String title;
   String description;
   String dueDate;
   bool status;

  Task(
      {
        required this.id,
        required this.title,
      required this.description,
      required this.dueDate,
      required this.status});

  // Task copyWith(
  //     {String? title, String? description, String? dueDate, bool? status}) {
  //   return Task(
  //       title: title ?? this.title,
  //       description: description ?? this.description,
  //       dueDate: dueDate ?? this.dueDate,
  //       status: status ?? this.status);
  // }

  @override
  String toString() {
    return 'Task(title: $title, description: $description, dueDate: $dueDate, status: $status)';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [title, description, dueDate, status];
}
