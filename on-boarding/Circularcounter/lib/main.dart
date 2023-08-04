import 'package:flutter/material.dart';

void main() {
  runApp(CircularCounterApp());
}

class CircularCounterApp extends StatefulWidget {
  const CircularCounterApp({super.key});

  @override
  State<CircularCounterApp> createState() => _CircularCounterAppState();
}

class _CircularCounterAppState extends State<CircularCounterApp> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      if (_counter == 10){
        _counter = 0;
      }
      else {
        _counter++;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter == 0){
        _counter = 10;
      }
      else {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Circular Counter App",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Circular Counter App"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'You have pushed the button this many times:',
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: _incrementCounter,
                      child: const Text("Increment"),
                  ),
                  ElevatedButton(
                    onPressed: _decrementCounter,
                    child: const Text("Decrement"),
                  ),
                ],
              ),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
