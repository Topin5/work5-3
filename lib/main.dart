import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:less6_month3/cubit/todo_cubit.dart';
import 'package:less6_month3/ui/page/todo_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit()..getAll(),
      child: const MaterialApp(home: TodoPage(), ),
    );
  }
}
