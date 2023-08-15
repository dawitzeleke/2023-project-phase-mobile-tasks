import 'package:add_task/taskDetailPage.dart';
import 'package:add_task/taskModel.dart';
import 'package:flutter/material.dart';

import 'addTask.dart';
import 'controller/controller.dart';

class TodoList extends StatefulWidget {
  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    TaskController taskcontroller = TaskController();

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
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
        title: const Center(
          child: Text(
            "Todo List",
            style: TextStyle(
              fontFamily: "InterRegular",
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/images/image1.png",
                // width: width * 1,
                // height: height * 1,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Tasks list",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              itemCount: taskcontroller.taskManager.taskList.length,
              itemBuilder: (context, index) {
                return CustomListItem(
                    title: taskcontroller.taskManager.taskList[index].title,
                    status: taskcontroller.taskManager.taskList[index].status,
                    dueDate: taskcontroller.taskManager.taskList[index].dueDate,
                    description:
                        taskcontroller.taskManager.taskList[index].description,
                    onTaskEdit: () async {
                      final editTask = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TaskDetailPage(index: index,
                                  task: taskcontroller
                                      .taskManager.taskList[index])));
                      if (editTask != null) {
                        setState(() {
                          taskcontroller.taskManager.editTask(
                              index,
                              editTask.id,
                              editTask.title,
                              editTask.description,
                              editTask.dueDate,
                              editTask.status);
                        });
                      }
                    });
              },
            ),
            // ),

            Center(
              child: Container(
                width: 250,
                height: 40,
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                    onPressed: () async {
                      final createdTask = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddTask()),
                      );
                      if (createdTask != null) {
                        setState(() {
                          taskcontroller.taskManager.addTask(createdTask);
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text(
                      "Create task",
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
    );
  }
}

class CustomListItem extends StatefulWidget {
  final String title;
  final bool status;
  final String description;
  final String dueDate;
  final VoidCallback onTaskEdit;

  CustomListItem({
    required this.title,
    required this.status,
    required this.dueDate,
    required this.description,
    required this.onTaskEdit,
  });

  @override
  State<CustomListItem> createState() => _CustomListItemState();
}

class _CustomListItemState extends State<CustomListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: widget.onTaskEdit,
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            widget.title[0],
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(widget.title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.dueDate),
            Container(
              margin: const EdgeInsets.only(left: 8),
              height: 50,
              width: 5,
              color: widget.status == true ? Colors.green : Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
