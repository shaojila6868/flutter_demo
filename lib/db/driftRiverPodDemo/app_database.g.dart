// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TodosRiverPodTable extends TodosRiverPod
    with TableInfo<$TodosRiverPodTable, TodosRiverPodData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodosRiverPodTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isDoneMeta = const VerificationMeta('isDone');
  @override
  late final GeneratedColumn<bool> isDone = GeneratedColumn<bool>(
    'is_done',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_done" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, title, isDone];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todos_river_pod';
  @override
  VerificationContext validateIntegrity(
    Insertable<TodosRiverPodData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('is_done')) {
      context.handle(
        _isDoneMeta,
        isDone.isAcceptableOrUnknown(data['is_done']!, _isDoneMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TodosRiverPodData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodosRiverPodData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      isDone: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_done'],
      )!,
    );
  }

  @override
  $TodosRiverPodTable createAlias(String alias) {
    return $TodosRiverPodTable(attachedDatabase, alias);
  }
}

class TodosRiverPodData extends DataClass
    implements Insertable<TodosRiverPodData> {
  final int id;
  final String title;
  final bool isDone;
  const TodosRiverPodData({
    required this.id,
    required this.title,
    required this.isDone,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['is_done'] = Variable<bool>(isDone);
    return map;
  }

  TodosRiverPodCompanion toCompanion(bool nullToAbsent) {
    return TodosRiverPodCompanion(
      id: Value(id),
      title: Value(title),
      isDone: Value(isDone),
    );
  }

  factory TodosRiverPodData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodosRiverPodData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      isDone: serializer.fromJson<bool>(json['isDone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'isDone': serializer.toJson<bool>(isDone),
    };
  }

  TodosRiverPodData copyWith({int? id, String? title, bool? isDone}) =>
      TodosRiverPodData(
        id: id ?? this.id,
        title: title ?? this.title,
        isDone: isDone ?? this.isDone,
      );
  TodosRiverPodData copyWithCompanion(TodosRiverPodCompanion data) {
    return TodosRiverPodData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      isDone: data.isDone.present ? data.isDone.value : this.isDone,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TodosRiverPodData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('isDone: $isDone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, isDone);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodosRiverPodData &&
          other.id == this.id &&
          other.title == this.title &&
          other.isDone == this.isDone);
}

class TodosRiverPodCompanion extends UpdateCompanion<TodosRiverPodData> {
  final Value<int> id;
  final Value<String> title;
  final Value<bool> isDone;
  const TodosRiverPodCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.isDone = const Value.absent(),
  });
  TodosRiverPodCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.isDone = const Value.absent(),
  }) : title = Value(title);
  static Insertable<TodosRiverPodData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<bool>? isDone,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (isDone != null) 'is_done': isDone,
    });
  }

  TodosRiverPodCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<bool>? isDone,
  }) {
    return TodosRiverPodCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (isDone.present) {
      map['is_done'] = Variable<bool>(isDone.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodosRiverPodCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('isDone: $isDone')
          ..write(')'))
        .toString();
  }
}

abstract class _$TodosRiverPodAppDatabase extends GeneratedDatabase {
  _$TodosRiverPodAppDatabase(QueryExecutor e) : super(e);
  $TodosRiverPodAppDatabaseManager get managers =>
      $TodosRiverPodAppDatabaseManager(this);
  late final $TodosRiverPodTable todosRiverPod = $TodosRiverPodTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todosRiverPod];
}

typedef $$TodosRiverPodTableCreateCompanionBuilder =
    TodosRiverPodCompanion Function({
      Value<int> id,
      required String title,
      Value<bool> isDone,
    });
typedef $$TodosRiverPodTableUpdateCompanionBuilder =
    TodosRiverPodCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<bool> isDone,
    });

class $$TodosRiverPodTableFilterComposer
    extends Composer<_$TodosRiverPodAppDatabase, $TodosRiverPodTable> {
  $$TodosRiverPodTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDone => $composableBuilder(
    column: $table.isDone,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TodosRiverPodTableOrderingComposer
    extends Composer<_$TodosRiverPodAppDatabase, $TodosRiverPodTable> {
  $$TodosRiverPodTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDone => $composableBuilder(
    column: $table.isDone,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TodosRiverPodTableAnnotationComposer
    extends Composer<_$TodosRiverPodAppDatabase, $TodosRiverPodTable> {
  $$TodosRiverPodTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<bool> get isDone =>
      $composableBuilder(column: $table.isDone, builder: (column) => column);
}

class $$TodosRiverPodTableTableManager
    extends
        RootTableManager<
          _$TodosRiverPodAppDatabase,
          $TodosRiverPodTable,
          TodosRiverPodData,
          $$TodosRiverPodTableFilterComposer,
          $$TodosRiverPodTableOrderingComposer,
          $$TodosRiverPodTableAnnotationComposer,
          $$TodosRiverPodTableCreateCompanionBuilder,
          $$TodosRiverPodTableUpdateCompanionBuilder,
          (
            TodosRiverPodData,
            BaseReferences<
              _$TodosRiverPodAppDatabase,
              $TodosRiverPodTable,
              TodosRiverPodData
            >,
          ),
          TodosRiverPodData,
          PrefetchHooks Function()
        > {
  $$TodosRiverPodTableTableManager(
    _$TodosRiverPodAppDatabase db,
    $TodosRiverPodTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TodosRiverPodTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TodosRiverPodTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TodosRiverPodTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<bool> isDone = const Value.absent(),
              }) =>
                  TodosRiverPodCompanion(id: id, title: title, isDone: isDone),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                Value<bool> isDone = const Value.absent(),
              }) => TodosRiverPodCompanion.insert(
                id: id,
                title: title,
                isDone: isDone,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TodosRiverPodTableProcessedTableManager =
    ProcessedTableManager<
      _$TodosRiverPodAppDatabase,
      $TodosRiverPodTable,
      TodosRiverPodData,
      $$TodosRiverPodTableFilterComposer,
      $$TodosRiverPodTableOrderingComposer,
      $$TodosRiverPodTableAnnotationComposer,
      $$TodosRiverPodTableCreateCompanionBuilder,
      $$TodosRiverPodTableUpdateCompanionBuilder,
      (
        TodosRiverPodData,
        BaseReferences<
          _$TodosRiverPodAppDatabase,
          $TodosRiverPodTable,
          TodosRiverPodData
        >,
      ),
      TodosRiverPodData,
      PrefetchHooks Function()
    >;

class $TodosRiverPodAppDatabaseManager {
  final _$TodosRiverPodAppDatabase _db;
  $TodosRiverPodAppDatabaseManager(this._db);
  $$TodosRiverPodTableTableManager get todosRiverPod =>
      $$TodosRiverPodTableTableManager(_db, _db.todosRiverPod);
}
