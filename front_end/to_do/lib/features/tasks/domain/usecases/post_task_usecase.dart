import 'package:dartz/dartz.dart';
import 'package:to_do/core/error/failure.dart';
import 'package:to_do/core/usecase/usecase.dart';
import 'package:to_do/features/tasks/data/params/create_task_params.dart';
import 'package:to_do/features/tasks/domain/repository/task_repository.dart';

class PostTaskUsecase implements UseCase<void, CreateTaskParms>{
  
  final TaskRepository taskRepository;

  PostTaskUsecase({required this.taskRepository});
  
  @override
  Future<Either<Failure, void>> call(CreateTaskParms params) async{

     return await taskRepository.postTask(params);

    
  }
}