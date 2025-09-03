

import 'package:dartz/dartz.dart';
import 'package:to_do/core/error/failure.dart';
import 'package:to_do/core/usecase/no_params.dart';
import 'package:to_do/core/usecase/usecase.dart';
import 'package:to_do/features/tasks/domain/enity/task_enity.dart';
import 'package:to_do/features/tasks/domain/repository/task_repository.dart';

class GetTasksUsecase implements UseCase<List<TaskEnity>, NoParams>{

  final TaskRepository taskRepository;
  GetTasksUsecase({required this.taskRepository});
  @override
  Future<Either<Failure, List<TaskEnity>>> call(NoParams params) async{
    return await taskRepository.getTasks();

  }
}