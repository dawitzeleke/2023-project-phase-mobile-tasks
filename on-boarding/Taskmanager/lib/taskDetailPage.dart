import 'package:flutter/material.dart';

class TaskDetailPage extends StatefulWidget {
  const TaskDetailPage({super.key});

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Task Detail",
      home: Scaffold(
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
          leading: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.red,
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
              child: TextField(
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
              padding: const EdgeInsets.only(
                  left: 17.5, top: 10, right: 17.5),
              child: TextField(
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
              child: TextField(
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
      ),
    );
  }
}
