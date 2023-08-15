import 'package:add_task/taskModel.dart';
import 'package:add_task/todoList.dart';
import 'package:flutter/material.dart';

import 'controller/controller.dart';

class TaskDetailPage extends StatefulWidget {
  final int index;
  final Task task;
  const TaskDetailPage({super.key, required this.task,required this.index});

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  String taskName = "";
  String dueDate = "";
  String description = "";
  bool status = false;
  TaskController taskcontroller = TaskController();

  void markAsUnDone(){
    Task newTask = Task(
      id: widget.task.id,
        title: taskName==""?widget.task.title:taskName,
        description: description==""?widget.task.description:description,
        dueDate: dueDate==""?widget.task.dueDate:dueDate,
        status: widget.task.status = false
        );
    Navigator.pop(context, newTask);
  }

  void markAsDone(){
    Task newTask = Task(
      id: widget.task.id,
        title: taskName==""?widget.task.title:taskName,
        description: description==""?widget.task.description:description,
        dueDate: dueDate==""?widget.task.dueDate:dueDate,
        status: widget.task.status = true
        );
    Navigator.pop(context, newTask);
  }

  void editTask() {
    Task newTask = Task(
      id: widget.task.id,
        title: taskName==""?widget.task.title:taskName,
        description: description==""?widget.task.description:description,
        dueDate: dueDate==""?widget.task.dueDate:dueDate,
        status: false 
        );
    Navigator.pop(context, newTask);
  }
  void deleteTask(){
    taskcontroller.taskManager.deleteTask(widget.index);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>TodoList()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Task Detail",
            style: TextStyle(
              fontFamily: "InterRegular",
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.red,
          ),
          onPressed: () => editTask(),
        ),
        actions: [
          PopupMenuButton(
          // initialValue: selectedMenu,
          onSelected: (value) {
            if(value == "Mark as done"){
              markAsDone();
            }
            if (value == "Delete task"){
              deleteTask();
            }
            if (value == "Mark as undone"){
              markAsUnDone();
            }
          },
            
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: "Mark as done",
              child: Text('Mark as done'),
            ),

            const PopupMenuItem(
              value: "Mark as undone",
              child: Text('Mark as undone'),
            ),

            const PopupMenuItem(
              value: "Delete task",
              child: Text('Delete task'),
            ),

          ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset("assets/images/image2.png"),
            ),
            Container(
              padding: const EdgeInsets.only(left: 17.5, top: 20),
              alignment: Alignment.topLeft,
              child: const Text(
                "Title",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17.5, top: 10, right: 17.5),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    taskName = value;
                  });
                },
                initialValue: widget.task.title,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[50],
                  // border: InputBorder.none,
                  // contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 17.5, top: 20),
              alignment: Alignment.topLeft,
              child: const Text(
                "Description",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17.5, top: 10, right: 17.5),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
                initialValue: widget.task.description,
                maxLines: null,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[50],
                  // border: InputBorder.none,
                  // contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 17.5, top: 20),
              alignment: Alignment.topLeft,
              child: const Text(
                "Deadline",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17.5, top: 10, right: 17.5),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    dueDate = value;
                  });
                },
                initialValue: widget.task.dueDate,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[50],
                  // border: InputBorder.none,
                  // contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
  
