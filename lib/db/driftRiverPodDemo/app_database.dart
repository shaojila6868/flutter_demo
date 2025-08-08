
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

class TodosRiverPod extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  BoolColumn get isDone => boolean().withDefault(Constant(false))();
}

@DriftDatabase(tables: [TodosRiverPod])
class TodosRiverPodAppDatabase extends _$TodosRiverPodAppDatabase{
  TodosRiverPodAppDatabase(): super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFlot = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFlot.path, 'riverpod_database.sqlite'));
    return NativeDatabase(file);
  });
}