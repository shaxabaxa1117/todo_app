import 'package:dartz/dartz.dart';
import 'package:to_do/core/error/failure.dart';
import 'package:to_do/core/usecase/usecase.dart';
import 'package:to_do/features/tasks/data/DTO/createTaskDTO.dart';
import 'package:to_do/features/tasks/domain/repository/task_repository.dart';

class PostTaskUsecase implements UseCase<void, CreateTaskDTO>{
  
  final TaskRepository taskRepository;

  PostTaskUsecase({required this.taskRepository});
  
  @override
  Future<Either<Failure, void>> call(CreateTaskDTO params) async{

     return await taskRepository.postTask(params);

    
  }
}