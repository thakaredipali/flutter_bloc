class Todo {
  final int id;
  final String task;
  final bool isDone;

  Todo({
    required this.id,
    required this.task,
    this.isDone = false,
  });

}
