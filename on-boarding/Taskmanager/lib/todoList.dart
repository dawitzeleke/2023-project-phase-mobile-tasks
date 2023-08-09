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
    List<Task> taskList = taskcontroller.taskManager.viewAllTasks();

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Task manager",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.red,
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
        body: SingleChildScrollView( child: Column(
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
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                return CustomListItem(
                    title: taskList[index].title,
                    status: taskList[index].status,
                    dueDate: taskList[index].dueDate);
              },
            ),
            // ),

            Center(
              child: Container(
                width: 250,
                height: 40,
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddTask()),
                      );
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
      ),
    );
  }
}

class CustomListItem extends StatelessWidget {
  final String title;
  final bool status;
  final String dueDate;

  CustomListItem({
    required this.title,
    required this.status,
    required this.dueDate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            title[0],
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(dueDate),
            Container(
              margin: const EdgeInsets.only(left: 8),
              height: 50,
              width: 5,
              color: status == true ? Colors.green : Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
