import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_proj/model/todo_model.dart';
import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  int _idCounter = 0;
  List<Todo> _todos = [];

  TodoBloc() : super(TodoInitial()) {
    /// Add todo
    on<AddTodo>((event, emit) {
      final newTodo = Todo(id: _idCounter, task: event.task);
      _idCounter++;
      _todos = List.from(_todos);
      _todos.add(newTodo);
      emit(TodoAddedState(_todos));
    });

  /// Mark todo as done
    on<DoneTodo>((event, emit) {
      List<Todo> updatedTodos = [];
      for (var todo in _todos) {
        if (todo.id == event.id) {
          updatedTodos.add(Todo(
            id: todo.id,
            task: todo.task,
            isDone: !todo.isDone,
          ));
        } else {
          updatedTodos.add(todo);
        }
      }
      _todos = updatedTodos;
      emit(TodoAddedState(List.from(_todos)));
    });

/// Delete todo
    on<DeleteTodo>((event, emit) {
      _todos.removeWhere((todo) => todo.id == event.id);
      emit(TodoAddedState(List.from(_todos)));
    });
  }
}
