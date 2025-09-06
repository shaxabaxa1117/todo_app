
import 'package:dartz/dartz.dart';
import 'package:to_do/core/error/failure.dart';
import 'package:to_do/features/tasks/data/DTO/createTaskDTO.dart';
import 'package:to_do/features/tasks/domain/enity/task_enity.dart';

abstract interface class TaskRepository {

  Future<Either<Failure, List<TaskEnity>>> getTasks();
  Future<Either<Failure, void>> postTask(CreateTaskDTO task);
  Future<Either<Failure, void>> deleteTask(int taskId);
}
