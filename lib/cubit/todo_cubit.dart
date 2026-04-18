import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:less6_month3/cubit/todo_state.dart';
import 'package:less6_month3/data/local/app_database.dart';
import 'package:less6_month3/data/source/todo_local_datasource.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoLoadingState()) {
    appDatabase = AppDatabase();
    datasource = TodoLocalDatasource(appDatabase);
  }

  late AppDatabase appDatabase;
  late TodoLocalDatasource datasource;

  void getAll() async {
    emit(TodoLoadingState());
    try {
      final todos = await datasource.getAll();
      if (todos.isEmpty) {
        emit(TodoErrorState(error: 'Пусто'));
      } else {
        emit(TodoSuccessState(todos: todos));
      }
    } catch (e) {
      emit(TodoErrorState(error: '$e'));
    }
  }

  void addTodo(String title, String description) async {
    emit(TodoLoadingState());
    try {
      await datasource.addTodo(title, description);
      getAll();
    } catch (e) {
      emit(TodoErrorState(error: '$e'));
    }
  }

  void editTodo(TodoModelData todoModel) async {
    emit(TodoLoadingState());
    try {
      await datasource.editTodo(
        todoModel.title,
        todoModel.description,
        todoModel.id,
      );
      getAll();
    } catch (e) {
      emit(TodoErrorState(error: '$e'));
    }
  }

  void search(String query) async {
    emit(TodoLoadingState());
    try {
      final todos = await datasource.searchTodo(query);
      emit(TodoSuccessState(todos: todos));
    } catch (e) {
      emit(TodoErrorState(error: '$e'));
    }
  }

  void delete(int id) async {
    emit(TodoLoadingState());
    try {
      await datasource.delete(id);
      getAll();
    } catch (e) {
      emit(TodoErrorState(error: '$e'));
    }
  }
}
