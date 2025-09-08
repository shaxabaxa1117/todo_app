import 'dart:io';

import 'package:dio/dio.dart';
import 'package:to_do/core/consts/app_consts.dart';
import 'package:to_do/core/error/exceptions.dart';
import 'package:to_do/core/log/app_logger.dart';
import 'package:to_do/features/tasks/data/params/create_task_params.dart';
import 'package:to_do/features/tasks/data/model/task_model.dart';
import 'package:to_do/features/tasks/data/params/update_task_params.dart';

abstract interface class RemoteTaskDataApi {
  Future<List<TaskModel>> getTasks();
  Future<void> postTasks(CreateTaskParms task);
  Future<void> deleteTask(int taskId);
  Future<void> updateTask(UpdateTaskParams taskParams);
}

class RemoteTaskDataApiImpl implements RemoteTaskDataApi {
  final Dio dio;
  RemoteTaskDataApiImpl({required this.dio});

  @override
  Future<List<TaskModel>> getTasks() async {
    try {
            await Future.delayed(const Duration(seconds: 1));
      final response = await dio.get(AppConsts.baseUrl);


      final List<dynamic> data = response.data;
      final tasks = data.map((e) => TaskModel.fromJson(e)).toList();

      if (response.statusCode == HttpStatus.ok) {
        AppLogger.logger.d("task accesed successfully");
      }

      return tasks;
    } on DioException catch (e) {
      AppLogger.logger.e("❌ Unexpected error:", error: e);
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> deleteTask(int taskId) async {
    try {


      final response = await dio.delete("${AppConsts.baseUrl}/$taskId");

      if (response.statusCode == HttpStatus.ok) {
        AppLogger.logger.d("Task deleted successfully");
      }
    } catch (e) {
      AppLogger.logger.e("❌ Unexpected error:", error: e);
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> postTasks(CreateTaskParms task) async {
    try {
      final response = await dio.post(
        AppConsts.baseUrl,
        data: {"title": task.title, "description": task.description},
      );

      if (response.statusCode == HttpStatus.ok) {
        AppLogger.logger.d("Task added successfully");
      }
    } on DioException catch (e) {
      AppLogger.logger.e("❌ Unexpected error:", error: e);

      throw ErrorHandler.handle(e);
    }
  }
  
  @override
  Future<void> updateTask(UpdateTaskParams taskParams) async{
    try{
      var a = taskParams.toJson();
      final response = await dio.patch(
        "${AppConsts.baseUrl}/${taskParams.taskId}",
        data: taskParams.toJson(),
      );

      if (response.statusCode == HttpStatus.ok) {
        AppLogger.logger.d("Task updated successfully");
      }
    } on DioException catch (e) {
      AppLogger.logger.e("❌ Unexpected error:", error: e);

      throw ErrorHandler.handle(e);
    }


  }

  
}
