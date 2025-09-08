class UpdateTaskParams {
  final int taskId;
  final String? title;
  final String? description;
  final bool? isCompleted;

  UpdateTaskParams({
    required this.taskId,
    this.title,
    this.description,
    this.isCompleted,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "id": 0,
      "is_completed": true,
    };
  }
}
