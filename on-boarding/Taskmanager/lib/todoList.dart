import 'dart:ffi';

import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {

  List<TodoListItem> todolist = [
    TodoListItem(title: "UI/UX Design", leading: "U", color: Colors.red, dueDate: "April. 29, 2023"),
    TodoListItem(title: "View candidates", leading: "V", color: Colors.yellow, dueDate: "April. 29, 2023"),
    TodoListItem(title: "Football cu Drybling", leading: "F", color: Colors.red, dueDate: "April. 29, 2023")
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Add Task",
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset("assets/images/image1.png"),
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
              // ListView.builder(
              //     shrinkWrap: true,
              //     itemCount: todolist.length,
              //    itemBuilder: (context, index) {
              //      return todolist[index];
              //    },
              //  ),
            Center(
              child: Container(
                width: 250,
                height: 40,
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(context,
                      //     // MaterialPageRoute(builder: (context) => addTask()));
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

class TodoListItem extends StatelessWidget {
  TodoListItem(
      {super.key,
      required this.title,
      required this.leading,
      required this.color,
      required this.dueDate});

  String title;
  String leading;
  Color color;
  String dueDate;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text("$leading"),
        ),
        title: Text('$title'),
        trailing: Row(
          children: [
            Text("$dueDate"),
           Container(
          margin: EdgeInsets.only(top: 3),
          color: color,
          // height: 50,
          // width: 5,
            )
          ],
        ),
      ),
    );
  }
}
