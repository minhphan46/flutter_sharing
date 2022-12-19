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
  Tasks _myListTasks = new Tasks();

  final _controler = TextEditingController();

  void deleteTask(Task task) {
    _myListTasks.deleteTask(task);
  }

  void saveTask() {}

  void createTask(BuildContext ctx) {
    showDialog(
      context: ctx,
      useRootNavigator: false,
      builder: (ctx) => MyDiaLog(
        controler: _controler,
        onSave: saveTask,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "To Do App",
          style: GoogleFonts.notoSans(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            useRootNavigator: false,
            builder: (ctx) => MyDiaLog(
              controler: _controler,
              onSave: saveTask,
            ),
          );
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
