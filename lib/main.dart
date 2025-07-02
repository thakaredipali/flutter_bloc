import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_proj/bloc/todo_bloc.dart';
import 'package:flutter_new_proj/screens/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoBloc>(
      create: (_) => TodoBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo BLoC App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: TodoPage(),
      ),
    );
  }
}

