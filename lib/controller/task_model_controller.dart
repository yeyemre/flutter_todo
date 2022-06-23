import 'package:get/get.dart';
import 'package:todo_app/models/task_model.dart';

class TaskModelController extends GetxController {
  final _taskModel = TaskModel.createInstance(
          name: 'emre', createdDate: DateTime.now(), isCompleted: false)
      .obs;

  TaskModel get taskModel => _taskModel.value;
  set taskModel(TaskModel taskModel) => _taskModel.value = taskModel;

  TaskModel createInstance(String name) {
    _taskModel.value = TaskModel.createInstance(
        name: name, createdDate: DateTime.now(), isCompleted: false);
    return _taskModel.value;
  }
}
