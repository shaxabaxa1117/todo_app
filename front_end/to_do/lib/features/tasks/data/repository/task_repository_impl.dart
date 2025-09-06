
import 'package:dartz/dartz.dart';
import 'package:to_do/core/error/failure.dart';
import 'package:to_do/features/tasks/data/DTO/createTaskDTO.dart';
import 'package:to_do/features/tasks/data/data_source/remote_task_data_api.dart';
import 'package:to_do/features/tasks/data/model/task_model.dart';
import 'package:to_do/features/tasks/domain/enity/task_enity.dart';
import 'package:to_do/features/tasks/domain/repository/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository{

  final RemoteTaskDataApi remoteTaskDataApi;

  TaskRepositoryImpl({required this.remoteTaskDataApi});

  @override
  Future<Either<Failure, void>> deleteTask(int taskId) async{
    

    try{
      final result = await remoteTaskDataApi.deleteTask(taskId);
      return Right(result);
    }on Failure catch(e){
      return Left(e);
    }

  }

  @override
  Future<Either<Failure, List<TaskEnity>>> getTasks() async{
    try{
      final result = await remoteTaskDataApi.getTasks();
      return Right(result);

    }on Failure catch(e){
      return Left(e);
    }

  }

  @override
  Future<Either<Failure, void>> postTask(CreateTaskDTO task) async{


    try{
      final result = remoteTaskDataApi.postTasks(task);
      return Right(result);
    }on Failure catch(e){
      return Left(e);
    }
  }
}