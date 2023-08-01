class Task{

  String? title, description;
  DateTime? dueDate;
  bool? completed;

  Task( String title, description,DateTime dueDate, bool status){
    this.title = title;
    this.description = description;
    this.dueDate = dueDate;
    this.completed = false;
  }
}

class TaskManager{

   List <Task> taskList = [];

  void addTask(Task task){
    taskList.add(task);
  }

  void viewAllTasks(){
    for (var task in taskList){
      print(task);
    }
  }

  void viewCompletedTasks(){
    for (var task in taskList){
      if (task.completed == true){
          print(task);
      }
    }
  }

  void viewPendingTasks(){
    for (var task in taskList){
      if (task.completed == false){
          print(task);
      }
    }
  }

  void editTask(int index, String? title, description, DateTime? dueDate, bool? completed){
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
          taskList[index].completed = completed;
        }
    }
  }

  void deleteTask(int index){
    if (index >= 0 && index < taskList.length){
      taskList.removeAt(index);
    }
  }
}
