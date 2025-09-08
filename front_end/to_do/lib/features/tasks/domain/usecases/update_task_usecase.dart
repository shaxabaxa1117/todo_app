
import 'package:dartz/dartz.dart';
import 'package:to_do/core/error/failure.dart';
import 'package:to_do/core/usecase/usecase.dart';
import 'package:to_do/features/tasks/data/params/update_task_params.dart';
import 'package:to_do/features/tasks/domain/repository/task_repository.dart';

class UpdateTaskUsecase implements UseCase<void, UpdateTaskParams>{

  final TaskRepository taskRepository;

  UpdateTaskUsecase({required this.taskRepository});
  @override
  Future<Either<Failure, void>> call(UpdateTaskParams params) async{

    return await taskRepository.updateTask(params);


  }
} 