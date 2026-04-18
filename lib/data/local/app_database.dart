import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:less6_month3/data/local/todo_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


part 'app_database.g.dart';

@DriftDatabase(tables: [TodoModel])
class AppDatabase extends _$AppDatabase{
  AppDatabase() : super(_init());



  @override
  int get schemaVersion => 1;
}

LazyDatabase _init(){
  return LazyDatabase(()async{
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, 'todo.sqlite'));
    return NativeDatabase.createBackgroundConnection(file);
  });
}