part of 'task_cubit.dart';

@immutable
sealed class TaskState {}

final class TaskInitial extends TaskState {}


class TaskLoading extends TaskState {} // загрузка

class TaskLoaded extends TaskState {
  final List<TaskEnity> tasks; 
  TaskLoaded(this.tasks);
}

class TaskError extends TaskState {
  final Failure failure;
  TaskError(this.failure);
}