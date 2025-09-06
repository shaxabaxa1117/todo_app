import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/features/tasks/presentation/cubit/task_cubit.dart';
import 'package:to_do/features/tasks/presentation/pages/home_page.dart';
import 'package:to_do/injection_container.dart' as di;

void main() async{
  runApp(const MyApp());
  await di.initializeDependencies();
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl.get<TaskCubit>()..fetchPosts(),
        ),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
      
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: MainApp()
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   Home();
    
  }
}

