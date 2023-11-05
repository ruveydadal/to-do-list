import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class Task {
  String description;
  bool isCompleted;

  Task(this.description, this.isCompleted);
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Task> tasks = [];
  bool isCompleted = true;

  void addTask(String task) {
    setState(() {
      tasks.add(Task(task, false));
    });
    Navigator.of(context).pop(); // Kapatılmış BottomSheet'i kapatmak için
  }

  void completeTask(int index) {
    setState(() {
      tasks[index].isCompleted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('TO DO LIST'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            title: Text(
              task.description,
              style: TextStyle(
                decoration: task.isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            leading: IconButton(
              icon: task.isCompleted
                  ? Icon(Icons.check_box)
                  : Icon(Icons.square_outlined),
              onPressed: () {
                completeTask(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              String newTask = '';
              return Container(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextField(
                        onChanged: (value) {
                          newTask = value;
                        },
                        decoration: InputDecoration(labelText: 'Görev ekle'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          addTask(newTask);
                        },
                        child: Text('Ekle'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
