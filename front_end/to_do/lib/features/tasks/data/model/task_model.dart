import 'package:to_do/features/tasks/domain/enity/task_enity.dart';

class TaskModel extends TaskEnity {
  const TaskModel({
    required super.title,
    required super.description,
    required super.id,
    required super.isCompleted,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      title: json['title'],
      description: json['description'],
      id: json['id'],
      isCompleted: json['is_completed'],
    );
  }

  factory TaskModel.fromEnity(TaskEnity taskEnity) {
    return TaskModel(
      title: taskEnity.title,
      description: taskEnity.description,
      id: taskEnity.id,
      isCompleted: taskEnity.isCompleted,
    );
  }
}
