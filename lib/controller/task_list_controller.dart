import 'package:get/get.dart';
import 'package:todo_app/controller/task_model_controller.dart';
import 'package:todo_app/models/task_model.dart';

class TaskListController extends GetxController {
  final taskModelController = Get.put(TaskModelController());

  static final listTask = [
    TaskModel.createInstance(
      name: 'Yunus Emre',
      createdDate: DateTime.now(),
      isCompleted: false,
    ),
  ].obs;

  void addTask(TaskModel taskModel) {
    listTask.add(taskModel);
  }

  void removeTask(TaskModel taskModel) {
    listTask.remove(taskModel);
  }

  void changeTaskStatus(TaskModel taskModel) {
    TaskModel model = listTask.firstWhere((element) => element == taskModel);

    if (model.isCompleted == true) {
      model.isCompleted = false;
    } else {
      model.isCompleted = true;
    }
  }
}
