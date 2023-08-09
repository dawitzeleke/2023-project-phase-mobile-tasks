import 'package:add_task/taskModel.dart';

class TaskManager {
  List<Task> taskList = [
    Task(
        title: "UI/UX App design",
        description:
            "First i have to animate the logo and prototyping my design. Its very important",
        dueDate: "April 29, 2023",
        status: false),
    Task(
        title: "UI/UX App design",
        description:
            "First i have to animate the logo and prototyping my design. Its very important",
        dueDate: "April 29, 2023",
        status: true),
    Task(
        title: "View candidates",
        description: "",
        dueDate: "April 29, 2023",
        status: false),
    Task(
        title: "Football Cu Drybling",
        description:
            "",
        dueDate: "April 29, 2023",
        status: false)
  ];

  void addTask(Task task) {
    taskList.add(task);
  }

  List<Task> viewAllTasks() {
    return taskList;
  }

  void viewCompletedTasks() {
    for (var task in taskList) {
      if (task.status == true) {
        print(task);
      }
    }
  }

  void viewPendingTasks() {
    for (var task in taskList) {
      if (task.status == false) {
        print(task);
      }
    }
  }

  void editTask(
      int index, String? title, description, String? dueDate, bool? completed) {
    if (index >= 0 && index < taskList.length) {
      if (title != null) {
        taskList[index].title = title;
      }
      if (description != null) {
        taskList[index].description = description;
      }
      if (dueDate != null) {
        taskList[index].dueDate = dueDate;
      }
      if (completed != null) {
        taskList[index].status = completed;
      }
    }
  }

  void deleteTask(int index) {
    if (index >= 0 && index < taskList.length) {
      taskList.removeAt(index);
    }
  }
}
