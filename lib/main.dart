import 'package:flutter/material.dart';
import 'package:task_management/pages/dialog_box.dart';
import 'package:task_management/pages/todo_tile.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TaskManagement(),
  ));
}

class TaskManagement extends StatefulWidget {
  const TaskManagement({super.key});

  @override
  State<TaskManagement> createState() => _TaskManagementState();
}

class _TaskManagementState extends State<TaskManagement> {
  final List _toDoList = [
    ["Code", false],
    ["Attend meeting", false],
    ["Sleep", false],
  ];

  final TextEditingController _controller = TextEditingController();

  void tickBoxChecked(bool? value, int index) {
    setState(() {
      _toDoList[index][1] = !_toDoList[index][1];
    });
  }

  void createTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialogBox(
          controller: _controller,
        );
      },
    ).then((value) {
      if (value != null && value.isNotEmpty) {
        setState(() {
          _toDoList.add([value, false]);
        });
        _controller.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[300],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Task Management',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: _toDoList.length,
        itemBuilder: (context, index) {
          return TodoListTile(
            taskName: _toDoList[index][0],
            isChecked: _toDoList[index][1],
            onChanged: (value) => tickBoxChecked(value, index),
          );
        },
      ),
    );
  }
}
