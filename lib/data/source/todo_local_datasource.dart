import 'package:drift/drift.dart';
import 'package:less6_month3/data/local/app_database.dart';

class TodoLocalDatasource {
  final AppDatabase database;
  TodoLocalDatasource(this.database);

  Future<List<TodoModelData>> getAll() async {
    final row = await database.select(database.todoModel).get();
    return row.map((row) {
      return TodoModelData(
        id: row.id,
        title: row.title,
        description: row.description,
        done: row.done,
      );
    }).toList();
  }

  Future addTodo(String title, String description) async {
    await database
        .into(database.todoModel)
        .insert(
          TodoModelCompanion(
            title: Value(title),
            description: Value(description),
          ),
        );
  }

  Future editTodo(String title, String description, int id) async {
    await (database.update(
      database.todoModel,
    )..where((todo) => todo.id.equals(id))).write(
      TodoModelCompanion(title: Value(title), description: Value(description)),
    );
  }

  Future<List<TodoModelData>> searchTodo(String query) async {
    final row = await (database.select(
      database.todoModel,
    )..where((todo) => todo.title.contains(query))).get();
    return row.map((row) {
      return TodoModelData(
        id: row.id,
        title: row.title,
        description: row.description,
        done: row.done,
      );
    }).toList();
  }

  Future delete(int id) async {
    await (database.delete(
      database.todoModel,
    )..where((todo) => todo.id.equals(id))).go();
  }
}
