import 'package:add_task/controller/controller.dart';
import 'package:add_task/taskModel.dart';
import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String taskName = "";
  String dueDate = "";
  String description = "";

  TaskController taskcontroller = TaskController();

  void addTask() {
  if (taskName.isNotEmpty && dueDate.isNotEmpty && description.isNotEmpty) {
    Task newTask = Task(
      id: "1",
      title: taskName,
      description: description,
      dueDate: dueDate,
      status: false,
    );
    Navigator.pop(context, newTask);
  } 
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.red,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(19),
                child: const Text(
                  "Create new task",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Divider(),
              Container(
                padding: const EdgeInsets.only(left: 35.0, top: 20),
                alignment: Alignment.topLeft,
                child: const Text(
                  "Main task name",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17.5, top: 10, right: 17.5),
                child: TextField(
                  key: Key('textfield1'),
                  onChanged: (value) {
                    setState(() {
                      taskName = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Colors.grey[50],
                    hintText: 'Enter your main task',
                    // border: InputBorder.none,
                    // contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 35.0, top: 20),
                alignment: Alignment.topLeft,
                child: const Text(
                  "Due date",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17.5, top: 10, right: 17.5),
                child: TextField(
                  key: Key('textfield2'),
                  onChanged: (value) {
                    setState(() {
                      dueDate = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Colors.grey[50],
                    hintText: 'Enter Due date',
                    // border: InputBorder.none,
                    // contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.calendar_today,
                        color: Colors.red,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 35.0, top: 20),
                alignment: Alignment.topLeft,
                child: const Text(
                  "Description",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                key: Key('textfield3'),
                padding: const EdgeInsets.only(
                    left: 17.5, top: 10, right: 17.5, bottom: 40),
                child: TextField(
                  onChanged: (value) {
                    description = value;
                  },
                  maxLines: null,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Colors.grey[50],
                    hintText: 'Enter Description',
                    // contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 150,
                  height: 40,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                      onPressed: addTask,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        "Add task",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "InterBold"),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
