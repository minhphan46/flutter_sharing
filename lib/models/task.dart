import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Task extends GetxController {
  RxString? id = DateTime.now().toString().obs;
  final RxString? title;
  final RxBool done;
  final Rx<Color>? color;
  Rx<DateTime> date = DateTime.now().obs;

  Task({
    this.id,
    required this.title,
    required this.done,
    required this.color,
  });

  void changeDone() {
    done.value = !done.value;
  }

  void updateTitle(String newtitle) {
    title!.value = newtitle;
  }
}
