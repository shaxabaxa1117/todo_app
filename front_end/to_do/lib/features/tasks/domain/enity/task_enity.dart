import 'package:equatable/equatable.dart';

class TaskEnity extends Equatable {
  final int id;
  final String title;
  final String description;
  final bool isCompleted;

  const TaskEnity({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted
  });

  @override
  List<Object?> get props => [id, title, description, isCompleted];
}