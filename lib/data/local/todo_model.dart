import 'package:drift/drift.dart';

class TodoModel extends Table{

  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 256)();
  TextColumn get description => text().withLength(min: 1, max: 256)();
  BoolColumn get done => boolean().withDefault(Constant(false))();

}