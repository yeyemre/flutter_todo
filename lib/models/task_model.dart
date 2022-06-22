import 'package:uuid/uuid.dart';

class TaskModel {
  final String id;
  final String name;
  final DateTime createdDate;
  final bool isCompleted;

  const TaskModel({
    required this.id,
    required this.name,
    required this.createdDate,
    required this.isCompleted,
  });

  factory TaskModel.createInstance({
    required String name,
    required DateTime createdDate,
    required bool isCompleted,
  }) {
    return TaskModel(
        id: const Uuid().v1(),
        name: name,
        createdDate: createdDate,
        isCompleted: isCompleted);
  }
}
