// task_model.dart
class Task {
  String title;
  String description;
  String dueDate;
  bool status;

  Task(
      {required this.title,
      required this.description,
      required this.dueDate,
      required this.status});

  @override
  String toString() {
    return 'Task(title: $title, description: $description, dueDate: $dueDate, status: $status)';
  }
}