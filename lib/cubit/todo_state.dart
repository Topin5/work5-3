// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:less6_month3/data/local/app_database.dart';

abstract class TodoState {}

class TodoSuccessState extends TodoState {
  List<TodoModelData> todos;
  TodoSuccessState({required this.todos});
}

class TodoErrorState extends TodoState {
  String error;
  TodoErrorState({required this.error});
}

class TodoLoadingState extends TodoState {}
