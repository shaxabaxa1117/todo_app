


import 'package:dartz/dartz.dart';
import 'package:to_do/core/error/failure.dart';
import 'package:to_do/features/tasks/domain/enity/task_enity.dart';

abstract interface class RemoteTaskDataApi {

  Future<Either<Failure, TaskEnity>> getTasks();
  Future<Either<Failure, TaskEnity>> postTasks();
}