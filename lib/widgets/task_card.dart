import 'package:flutter/material.dart';
import 'package:flutter_sharing/widgets/my_dialog.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../models/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final Function deleteTask;
  TaskCard(this.task, this.deleteTask);

  String getDate() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final dateToCheck = task.date.value;
    final aDate =
        DateTime(dateToCheck.year, dateToCheck.month, dateToCheck.day);
    if (aDate == today) {
      return DateFormat('kk:mm').format(task.date.value);
    }
    return DateFormat('kk:mm - MM/dd').format(task.date.value);
  }

  final _titleControler = TextEditingController();
  void updateTitle() {
    task.updateTitle(_titleControler.text);
    _titleControler.clear();
  }

  void createTask(BuildContext ctx) {
    _titleControler.text = task.title!.value;
    showDialog(
      context: ctx,
      useRootNavigator: false,
      builder: (ctx) => MyDiaLog(
        controler: _titleControler,
        onSave: updateTitle,
        title: "Update task",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(
                top: 25,
                left: 30,
                right: 25,
              ),
              child: Container(
                padding: const EdgeInsets.all(12),
                height: 80,
                decoration: BoxDecoration(
                  color: task.color!.value,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 25,
            left: 25,
            right: 30,
          ),
          child: Slidable(
            endActionPane: ActionPane(
              motion: StretchMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) => deleteTask(task),
                  icon: Icons.delete,
                  backgroundColor: Colors.transparent,
                ),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.all(12),
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  )),
              child: ListTile(
                leading: Obx(
                  () => Checkbox(
                    value: task.done.value,
                    activeColor: task.color!.value,
                    onChanged: (_) {
                      task.changeDone();
                    },
                  ),
                ), // icon o truoc tieu de
                title: Obx(
                  () => Text(
                    task.title!.value,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 18,
                      decoration: task.done.value
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ),
                trailing: Obx(
                  () => Text(
                    getDate(),
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 10,
                    ),
                  ),
                ),
                onLongPress: () {
                  createTask(context);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
