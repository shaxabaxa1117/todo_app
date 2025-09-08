import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:meta/meta.dart';
import 'package:to_do/core/error/failure.dart';
import 'package:to_do/core/usecase/no_params.dart';
import 'package:to_do/features/tasks/data/params/create_task_params.dart';
import 'package:to_do/features/tasks/data/params/update_task_params.dart';
import 'package:to_do/features/tasks/domain/enity/task_enity.dart';
import 'package:to_do/features/tasks/domain/usecases/delete_task_usecase.dart';
import 'package:to_do/features/tasks/domain/usecases/get_tasks_usecase.dart';
import 'package:to_do/features/tasks/domain/usecases/post_task_usecase.dart';
import 'package:to_do/features/tasks/domain/usecases/update_task_usecase.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final GetTasksUsecase getTasksUsecase;
  final PostTaskUsecase postTaskUsecase;
  final DeleteTaskUsecase deleteTaskUsecase;
  final UpdateTaskUsecase updateTaskUsecase;

  TaskCubit({
    required this.getTasksUsecase,
    required this.postTaskUsecase,
    required this.deleteTaskUsecase,
    required this.updateTaskUsecase,
  }) : super(TaskInitial());

  Future<void> fetchPosts() async {
    emit(TaskLoading());
    final result = await getTasksUsecase(NoParams());

    result.fold(
      (failure) => emit(TaskError(failure)),
      (success) => emit(TaskLoaded(success)),
    );
  }

  Future<void> addTask(CreateTaskParms task) async {
    emit(TaskLoading());

    final result = await postTaskUsecase(task);

    result.fold(
      (failure) => emit(TaskError(failure)),
      (success) async =>  await fetchPosts(),
    );
  }

  Future<void> deleteTask(int id) async {
    emit(TaskLoading());

    final result = await deleteTaskUsecase(id);

    result.fold(
      (failure) => emit(TaskError(failure)),
      (success) => fetchPosts(),
    );
  }
    Future<void> updateTask(UpdateTaskParams params) async {
    emit(TaskLoading());

    final result = await updateTaskUsecase(params);

    result.fold(
      (failure) => emit(TaskError(failure)),
      (success) => fetchPosts(),
    );
  }

}
