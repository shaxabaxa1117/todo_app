import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/features/tasks/data/DTO/createTaskDTO.dart';
import 'package:to_do/features/tasks/presentation/cubit/task_cubit.dart';

class AddTaskPage extends StatefulWidget {


  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Column(
        children: [

          TextField(
            controller: _titleController,
            
          ),
          TextField(

            controller: _descriptionController,
          ),
          ElevatedButton(onPressed: (){

  context.read<TaskCubit>().addTask(CreateTaskDTO(title: _titleController.text , description: _descriptionController.text));


          }, child: Text('Add Task'))
        ],




      ),
      
      );
  }
}