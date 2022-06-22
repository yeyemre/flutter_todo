import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/models/task_model.dart';

class TaskListController extends GetxController {
  static final listTask = [
    TaskModel(
        id: 'id',
        name: 'Yunus Emre',
        createdDate: DateTime.now(),
        isCompleted: false),
  ].obs;

  void addTask(TaskModel taskModel) {
    listTask.add(taskModel);
  }

  void removeTask(TaskModel taskModel) {
    listTask.remove(taskModel);
  }

  void changeTaskStatus(TaskModel taskModel) {
    TaskModel model = listTask.firstWhere((element) => taskModel == element);



    debugPrint('Metod çalıştı. isim: ${taskModel.name} mevcut durum: ${taskModel.isCompleted}');
  }
}
