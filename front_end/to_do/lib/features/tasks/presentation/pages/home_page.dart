import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/features/tasks/presentation/cubit/task_cubit.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar:  AppBar(),
body: BlocBuilder<TaskCubit,TaskState>(builder: (context, state) {
  if(state is TaskLoading){
    return Center(child: CircularProgressIndicator(),);
  }

  if(state is TaskLoaded){
    return ListView.builder(
        itemCount: state.tasks.length,
        itemBuilder: (context,index){
          final task = state.tasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text(task.description),
            trailing: Icon(
              task.isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
            ),
          );
        }
    );
  }
  // Default widget if no state matches

  if(state is TaskError){
    return Center(child: Text('Error: ${state.failure}'),);
  }
    return Center(child: Text('No tasks found.'));
}),
    );
    }
}