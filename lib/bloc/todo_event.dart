
abstract class TodoEvent {}

class AddTodo extends TodoEvent {
  final String task;
  AddTodo(this.task);
}

class DoneTodo extends TodoEvent {
  final int id;
  DoneTodo(this.id);
}

class DeleteTodo extends TodoEvent {
  final int id;
  DeleteTodo(this.id);
}
