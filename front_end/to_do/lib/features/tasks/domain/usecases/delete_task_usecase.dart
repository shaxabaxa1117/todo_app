

import 'package:dartz/dartz.dart';
import 'package:to_do/core/error/failure.dart';
import 'package:to_do/core/usecase/usecase.dart';
import 'package:to_do/features/tasks/domain/repository/task_repository.dart';

class DeleteTaskUsecase implements UseCase<void, int>{

  final TaskRepository taskRepository;

  DeleteTaskUsecase({required this.taskRepository});
  @override
  Future<Either<Failure, void>> call(int params) async {

    return await taskRepository.deleteTask(params);


  }
}