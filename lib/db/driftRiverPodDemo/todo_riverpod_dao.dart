import 'package:drift/drift.dart';
import 'app_database.dart';

part 'todo_riverpod_dao.g.dart';

@DriftAccessor(tables: [TodosRiverPod])
class TodoDiverPodDao extends DatabaseAccessor<TodosRiverPodAppDatabase> with _$TodoDiverPodDaoMixin{
  TodoDiverPodDao(TodosRiverPodAppDatabase db) : super(db);

  Stream<List<TodosRiverPodData>> watchTodos() => select(todosRiverPod).watch();

  Future<int> insertTodo(TodosRiverPodCompanion todo) => into(todosRiverPod).insert(todo);

  Future<int> updateTodoStatus(int id, bool isDone) {
    return (update(todosRiverPod)..where((tbl) => tbl.id.equals(id)))
        .write(TodosRiverPodCompanion(isDone: Value(isDone)));
  }

  Future<int> deleteTodoById(int id) {
    return (delete(todosRiverPod)..where((tbl) => tbl.id.equals(id))).go();
  }
}