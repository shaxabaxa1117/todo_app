

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:to_do/core/consts/app_consts.dart';
import 'package:to_do/core/error/exceptions.dart';
import 'package:to_do/core/log/app_logger.dart';
import 'package:to_do/features/tasks/data/DTO/createTaskDTO.dart';
import 'package:to_do/features/tasks/data/model/task_model.dart';


abstract interface class RemoteTaskDataApi {

  Future<List<TaskModel>> getTasks();
  Future<void> postTasks(CreateTaskDTO task);
  Future<void> deleteTask(int taskId);
}


class RemoteTaskDataApiImpl implements RemoteTaskDataApi{

  final Dio dio;
  RemoteTaskDataApiImpl({required this.dio});


    @override   
  Future<List<TaskModel>> getTasks() async{
    try{

      final response = await dio.get(AppConsts.baseUrl);

      

      
        final List<dynamic> data = response.data;
        final tasks = data.map((e) => TaskModel.fromJson(e)).toList();
 
           if (response.statusCode == HttpStatus.ok) {
        AppLogger.logger.d(
          "task accesed successfully",
        );
      }


       return tasks;

      
    }on DioException catch(e){
  AppLogger.logger.e("❌ Unexpected error:", error: e);
      throw ErrorHandler.handle(e);



    }
  }



  @override
  Future<void> deleteTask(int taskId) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }


  @override
  Future<void> postTasks(CreateTaskDTO task) async{

    try{
      final response = await dio.post(AppConsts.baseUrl,data: {
        "title": task.title,
        "description": task.description,
      });

       if (response.statusCode == HttpStatus.ok) {
        AppLogger.logger.d(
          "Task added successfully",
        );
      }

    }on DioException catch(e){
      AppLogger.logger.e("❌ Unexpected error:", error: e);

      throw ErrorHandler.handle(e);
    


    

  }

}

}