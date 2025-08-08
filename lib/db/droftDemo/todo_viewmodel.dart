import 'package:flutter/material.dart';
import 'appDatabase.dart';

class TodoVieModel extends ChangeNotifier {
  final AppDatabase db;

  TodoVieModel(this.db);

  Stream<List<Todo>> get todos => db.watchTodos();

  Future<void> addTodo(String title) async {
    await db.insertTodo(title);
  }

  Future<void> toggleTodo(Todo todo) async {
    await db.toggleCompleted(todo);
  }

  Future<List<Todo>> getTodos() async{
    return await db.getAllTodos();;
  }

  List<Todo> todoList = [];

  setTodoList(List<Todo> datas) {
    todoList = datas;
  }

}