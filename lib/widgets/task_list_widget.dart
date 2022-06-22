import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/controller/task_list_controller.dart';
import 'package:todo_app/models/task_model.dart';

// ignore: must_be_immutable
class AllTaskListWidget extends StatelessWidget {
  AllTaskListWidget({Key? key}) : super(key: key);
  var listTask = TaskListController.listTask;
  final TaskListController taskListController = Get.put(TaskListController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
          itemCount: listTask.length,
          itemBuilder: (BuildContext context, int index) {
            TaskModel currentTask = listTask[index];

            return Card(
              color: Colors.amberAccent.shade200,
              child: ListTile(
                leading: _checkIsCompletedWidget(currentTask),
                title: Text(
                  currentTask.name,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                trailing: Text(
                    DateFormat('HH:mm:ss').format(currentTask.createdDate)),
              ),
            );
          }),
    );
  }

  Widget _checkIsCompletedWidget(TaskModel currentTask) {
    debugPrint('gelenler: ${currentTask.isCompleted}');
    return InkWell(
      child: CircleAvatar(),
      onTap: () => taskListController.changeTaskStatus(currentTask),
    );
  }
}
