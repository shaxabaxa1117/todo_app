import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:to_do/core/error/failure.dart';
import 'package:to_do/core/usecase/no_params.dart';
import 'package:to_do/features/tasks/domain/enity/task_enity.dart';
import 'package:to_do/features/tasks/domain/usecases/get_tasks_usecase.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
final GetTasksUsecase getTasksUsecase;



  TaskCubit({required this.getTasksUsecase}) : super(TaskInitial());


    Future<void> fetchPosts() async {
    emit(TaskLoading());

      final result = await getTasksUsecase(NoParams());

      result.fold((failure) => emit(TaskError(failure)), (success)=> emit(TaskLoaded(success)) );


  }
}
