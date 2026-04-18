// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TodoModelTable extends TodoModel
    with TableInfo<$TodoModelTable, TodoModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoModelTable(this.attachedDatabase, [this._alias]);
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
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _doneMeta = const VerificationMeta('done');
  @override
  late final GeneratedColumn<bool> done = GeneratedColumn<bool>(
    'done',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("done" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, title, description, done];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todo_model';
  @override
  VerificationContext validateIntegrity(
    Insertable<TodoModelData> instance, {
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
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('done')) {
      context.handle(
        _doneMeta,
        done.isAcceptableOrUnknown(data['done']!, _doneMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TodoModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodoModelData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      done: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}done'],
      )!,
    );
  }

  @override
  $TodoModelTable createAlias(String alias) {
    return $TodoModelTable(attachedDatabase, alias);
  }
}

class TodoModelData extends DataClass implements Insertable<TodoModelData> {
  final int id;
  final String title;
  final String description;
  final bool done;
  const TodoModelData({
    required this.id,
    required this.title,
    required this.description,
    required this.done,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['done'] = Variable<bool>(done);
    return map;
  }

  TodoModelCompanion toCompanion(bool nullToAbsent) {
    return TodoModelCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      done: Value(done),
    );
  }

  factory TodoModelData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoModelData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      done: serializer.fromJson<bool>(json['done']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'done': serializer.toJson<bool>(done),
    };
  }

  TodoModelData copyWith({
    int? id,
    String? title,
    String? description,
    bool? done,
  }) => TodoModelData(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    done: done ?? this.done,
  );
  TodoModelData copyWithCompanion(TodoModelCompanion data) {
    return TodoModelData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      done: data.done.present ? data.done.value : this.done,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TodoModelData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('done: $done')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, done);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoModelData &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.done == this.done);
}

class TodoModelCompanion extends UpdateCompanion<TodoModelData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<bool> done;
  const TodoModelCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.done = const Value.absent(),
  });
  TodoModelCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    this.done = const Value.absent(),
  }) : title = Value(title),
       description = Value(description);
  static Insertable<TodoModelData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<bool>? done,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (done != null) 'done': done,
    });
  }

  TodoModelCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? description,
    Value<bool>? done,
  }) {
    return TodoModelCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      done: done ?? this.done,
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (done.present) {
      map['done'] = Variable<bool>(done.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoModelCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('done: $done')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TodoModelTable todoModel = $TodoModelTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todoModel];
}

typedef $$TodoModelTableCreateCompanionBuilder =
    TodoModelCompanion Function({
      Value<int> id,
      required String title,
      required String description,
      Value<bool> done,
    });
typedef $$TodoModelTableUpdateCompanionBuilder =
    TodoModelCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> description,
      Value<bool> done,
    });

class $$TodoModelTableFilterComposer
    extends Composer<_$AppDatabase, $TodoModelTable> {
  $$TodoModelTableFilterComposer({
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

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get done => $composableBuilder(
    column: $table.done,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TodoModelTableOrderingComposer
    extends Composer<_$AppDatabase, $TodoModelTable> {
  $$TodoModelTableOrderingComposer({
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

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get done => $composableBuilder(
    column: $table.done,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TodoModelTableAnnotationComposer
    extends Composer<_$AppDatabase, $TodoModelTable> {
  $$TodoModelTableAnnotationComposer({
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

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get done =>
      $composableBuilder(column: $table.done, builder: (column) => column);
}

class $$TodoModelTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TodoModelTable,
          TodoModelData,
          $$TodoModelTableFilterComposer,
          $$TodoModelTableOrderingComposer,
          $$TodoModelTableAnnotationComposer,
          $$TodoModelTableCreateCompanionBuilder,
          $$TodoModelTableUpdateCompanionBuilder,
          (
            TodoModelData,
            BaseReferences<_$AppDatabase, $TodoModelTable, TodoModelData>,
          ),
          TodoModelData,
          PrefetchHooks Function()
        > {
  $$TodoModelTableTableManager(_$AppDatabase db, $TodoModelTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TodoModelTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TodoModelTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TodoModelTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<bool> done = const Value.absent(),
              }) => TodoModelCompanion(
                id: id,
                title: title,
                description: description,
                done: done,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String description,
                Value<bool> done = const Value.absent(),
              }) => TodoModelCompanion.insert(
                id: id,
                title: title,
                description: description,
                done: done,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TodoModelTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TodoModelTable,
      TodoModelData,
      $$TodoModelTableFilterComposer,
      $$TodoModelTableOrderingComposer,
      $$TodoModelTableAnnotationComposer,
      $$TodoModelTableCreateCompanionBuilder,
      $$TodoModelTableUpdateCompanionBuilder,
      (
        TodoModelData,
        BaseReferences<_$AppDatabase, $TodoModelTable, TodoModelData>,
      ),
      TodoModelData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TodoModelTableTableManager get todoModel =>
      $$TodoModelTableTableManager(_db, _db.todoModel);
}
