import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do/features/tasks/data/data_source/remote_task_data_api.dart';
import 'package:to_do/features/tasks/data/repository/task_repository_impl.dart';
import 'package:to_do/features/tasks/domain/repository/task_repository.dart';
import 'package:to_do/features/tasks/domain/usecases/delete_task_usecase.dart';
import 'package:to_do/features/tasks/domain/usecases/get_tasks_usecase.dart';
import 'package:to_do/features/tasks/domain/usecases/post_task_usecase.dart';
import 'package:to_do/features/tasks/domain/usecases/update_task_usecase.dart';
import 'package:to_do/features/tasks/presentation/cubit/task_cubit.dart';

GetIt sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerFactory(() => Dio());

  sl.registerFactory<RemoteTaskDataApi>(
    () => RemoteTaskDataApiImpl(dio: sl<Dio>()),
  );

  sl.registerFactory<TaskRepository>(
    () => TaskRepositoryImpl(remoteTaskDataApi: sl<RemoteTaskDataApi>()),
  );

  sl.registerFactory<GetTasksUsecase>(
    () => GetTasksUsecase(taskRepository: sl<TaskRepository>()),
  );

  sl.registerFactory<PostTaskUsecase>(
    () => PostTaskUsecase(taskRepository: sl<TaskRepository>()),
  );

  sl.registerFactory<DeleteTaskUsecase>(
    () => DeleteTaskUsecase(taskRepository: sl<TaskRepository>()),
  );

  sl.registerFactory<UpdateTaskUsecase>(
    () => UpdateTaskUsecase(taskRepository: sl<TaskRepository>()),
  );

  sl.registerFactory<TaskCubit>(
    () => TaskCubit(
      getTasksUsecase: sl<GetTasksUsecase>(),
      postTaskUsecase: sl<PostTaskUsecase>(),
      deleteTaskUsecase: sl<DeleteTaskUsecase>(),
      updateTaskUsecase: sl<UpdateTaskUsecase>(),
    ),
  );
}
