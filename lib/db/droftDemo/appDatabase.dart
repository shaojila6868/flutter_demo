
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'todos_table.dart';
import 'package:drift/native.dart';

part "appDatabase.g.dart";

@DriftDatabase(tables: [Todos])
class AppDatabase extends _$AppDatabase{
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  //전체 불러오기
  Future<List<Todo>> getAllTodos() => select(todos).get();

  //Stream으로 감시 (LiveData처럼)
  Stream<List<Todo>> watchTodos() => select(todos).watch();

  //삼입
  Future<void> insertTodo(String title) async {
    await into(todos).insert(TodosCompanion(title: Value(title)));
  }

  Future<void> toggleCompleted(Todo todo) async {
    await update(todos).replace(todo.copyWith(completed: !todo.completed));
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) {
      return m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if(from == 1) {
        //여기에 추가
        // await m.addColumn(todos, todos.createAlias as GeneratedColumn<Object>);
      }
    },
    beforeOpen: (details) async {
      // DB 열기 직전에 실행할 로직 (선택)
    }
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
     final dir = await getApplicationDocumentsDirectory();
     final file = File(p.join(dir.path, 'app_database.sqlite'));
     return NativeDatabase(file);
  });
}
