
import 'package:drift/drift.dart';
import 'package:flutter_demo/db/driftRiverPodDemo/app_database.dart';
import 'package:flutter_demo/db/driftRiverPodDemo/todo_riverpod_dao.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final databaseProvider = Provider<TodosRiverPodAppDatabase>((ref) => TodosRiverPodAppDatabase());
final todoDaoProvider = Provider<TodoDiverPodDao>((ref) {
  final db = ref.watch(databaseProvider); // 여기서 watch가 아니라 read를 사용하는게 맞을 듯.
  return TodoDiverPodDao(db);
});

final todoListProvider = StreamProvider((ref) {
  final dao = ref.watch(todoDaoProvider);
  return dao.watchTodos();
});

class TodoViewModel extends StateNotifier<AsyncValue<void>> {
  TodoViewModel(this.ref) : super(const AsyncData(null));

  final Ref ref;

  Future<void> addTodo(String title) async {
    final dao = ref.read(todoDaoProvider);
    await dao.insertTodo(TodosRiverPodCompanion(title: Value(title)));
  }

  Future<void> toggleTodoStatus(int id, bool isDone) async {
    final dao = ref.read(todoDaoProvider);
    await dao.updateTodoStatus(id, !isDone);
  }

  Future<void> deleteTodo(int id) async {
    final dao = ref.read(todoDaoProvider);
    await dao.deleteTodoById(id);
  }
}

final todoViewModelProvider = StateNotifierProvider<TodoViewModel, AsyncValue<void>>(
        (ref) => TodoViewModel(ref));