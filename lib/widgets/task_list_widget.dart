import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/controller/task_list_controller.dart';
import 'package:todo_app/models/task_model.dart';

// ignore: must_be_immutable
class AllTaskListWidget extends StatelessWidget {
  AllTaskListWidget({Key? key}) : super(key: key);

  final TaskListController taskListController = Get.put(TaskListController());

  var listTask = TaskListController.listTask;

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
              leading: InkWell(
                child: _checkBoxIsCompletedWidget(currentTask),
                onTap: () {
                  taskListController.changeTaskStatus(currentTask);
                },
              ),
              title: Text(
                currentTask.name,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              trailing:
                  Text(DateFormat('HH:mm:ss').format(currentTask.createdDate)),
            ),
          );
        },
      ),
    );
  }

  Widget _checkBoxIsCompletedWidget(TaskModel currentTask) {
    return CircleAvatar(
      backgroundColor:
          currentTask.isCompleted == true ? Colors.blue : Colors.grey,
      child: Icon(
        currentTask.isCompleted == true
            ? Icons.check
            : Icons.cancel_presentation,
        color: currentTask.isCompleted == true ? Colors.white : Colors.black,
      ),
    );
  }
}
