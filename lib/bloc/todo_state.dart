



import 'package:flutter_new_proj/model/todo_model.dart';

abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoAddedState extends TodoState {
  final List<Todo> todos;
  TodoAddedState(this.todos);
}

class TodoErrorState extends TodoState {}
