import 'package:flutter/material.dart';
import 'package:flutter_sharing/models/task.dart';
import 'package:get/get.dart';

class Tasks extends GetxController {
  RxList<Task> tasks = [
    Task(
      id: 'p1'.obs,
      title: "Lam bai Tap".obs,
      done: false.obs,
      color: Colors.green.obs,
    ),
    Task(
      id: 'p2'.obs,
      title: "Di ngu".obs,
      done: false.obs,
      color: Colors.red.obs,
    ),
    Task(
      id: 'p3'.obs,
      title: "Di an".obs,
      done: false.obs,
      color: Colors.yellow.obs,
    ),
    Task(
      id: 'p4'.obs,
      title: "di uong".obs,
      done: false.obs,
      color: Colors.blue.obs,
    ),
    Task(
      id: 'p4'.obs,
      title: "Hoc tieng anh".obs,
      done: false.obs,
      color: Colors.grey.obs,
    ),
  ].obs;

  Tasks() {}

  void deleteTask(Task task) {
    tasks.remove(task);
  }
}
