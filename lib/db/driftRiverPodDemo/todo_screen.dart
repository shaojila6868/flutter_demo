
import 'package:flutter/material.dart';
import 'package:flutter_demo/db/driftRiverPodDemo/todo_riverpod_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoScreen extends ConsumerWidget {
  final TextEditingController _controller = TextEditingController();
  TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoListAsync = ref.watch(todoListProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: todoListAsync.when(
          data: (todos) => ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(todo.title, style: TextStyle(decoration: todo.isDone ? TextDecoration.lineThrough : null),),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(value: todo.isDone,
                          onChanged: (_) {
                            ref.read(todoViewModelProvider.notifier).toggleTodoStatus(todo.id, todo.isDone);
                          }),
                      IconButton(
                          onPressed: () {
                            ref.read(todoViewModelProvider.notifier).deleteTodo(todo.id);
                          },
                          icon: Icon(Icons.delete))
                    ],
                  ),
                );
              }),
          error: (e, _) => Center(child: Text('Error: $e'),),
          loading: () => Center(child: CircularProgressIndicator(),)),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final title = await _showAddDialog(context);
            if (title != null && title.isNotEmpty) {
              ref.read(todoViewModelProvider.notifier).addTodo(title);
              _controller.clear();
            }
          },
          child: Icon(Icons.add)),
    );
  }

  Future<String?> _showAddDialog(BuildContext context) async {
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Todo'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: 'Enter title'),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              child: Text('Add'),
              onPressed: () =>
                  Navigator.pop(context, _controller.text.trim()),
            ),
          ],
        );
      },
    );
  }
}