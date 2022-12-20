import 'package:flutter/material.dart';
import 'package:flutter_sharing/models/task.dart';
import 'package:flutter_sharing/models/tasks.dart';
import 'package:flutter_sharing/widgets/my_dialog.dart';
import 'package:flutter_sharing/widgets/task_card.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Tasks _myListTasks = Tasks();

  final _controler = TextEditingController();

  void deleteTask(Task task) {
    _myListTasks.deleteTask(task);
  }

  void saveTask() {
    _myListTasks.addTask(_controler.text);
    _controler.clear();
  }

  void createTask(BuildContext ctx) {
    showDialog(
      context: ctx,
      useRootNavigator: false,
      builder: (ctx) => MyDiaLog(
        controler: _controler,
        onSave: saveTask,
        title: "Add a new task",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "To Do",
            style: GoogleFonts.gothicA1(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        //centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createTask(context);
        },
        backgroundColor: Colors.white,
        shape: const StadiumBorder(
            side: BorderSide(color: Colors.black, width: 3)),
        child: const Icon(
          Icons.add,
          color: Colors.black,
          size: 30,
        ),
      ),
      body: Obx(
        () => ListView.builder(
          itemBuilder: (context, i) => TaskCard(
            _myListTasks.tasks[i],
            deleteTask,
          ),
          itemCount: _myListTasks.tasks.length,
        ),
      ),
    );
  }
}
