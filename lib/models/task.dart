import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Task extends GetxController {
  final RxString? id;
  final RxString? title;
  final RxBool done;
  final Rx<Color>? color;

  Task({
    required this.id,
    required this.title,
    required this.done,
    required this.color,
  });

  void changeDone() {
    done.value = !done.value;
  }
}
