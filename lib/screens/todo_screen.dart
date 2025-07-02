import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_proj/bloc/todo_bloc.dart';
import 'package:flutter_new_proj/bloc/todo_event.dart';
import 'package:flutter_new_proj/bloc/todo_state.dart';

class TodoPage extends StatelessWidget {
  TodoPage({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  key: Key('task'),
                  child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: 'Enter Task',
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  ),
                )),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.blue,
                  ),
                  highlightColor: Colors.blue.shade200,
                  iconSize: 30,
                  onPressed: () {
                    context.read<TodoBloc>().add(AddTodo(controller.text));
                    controller.clear();
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                if (state is TodoInitial) {
                  return Center(child: Text("No Task Added"));
                } else if (state is TodoAddedState) {
                  return ListView.builder(
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) {
                      final todo = state.todos[index];
                      return Card(
                        color: Colors.blue.shade200,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: ListTile(
                            title: Text(
                              todo.task,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                decoration: todo.isDone
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.check, color: Colors.green.shade800 ,size: 25, ),
                                  onPressed: () => context
                                      .read<TodoBloc>()
                                      .add(DoneTodo(todo.id)),
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => context
                                      .read<TodoBloc>()
                                      .add(DeleteTodo(todo.id)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
