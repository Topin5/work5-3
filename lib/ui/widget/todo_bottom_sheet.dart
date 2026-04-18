import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:less6_month3/cubit/todo_cubit.dart';
import 'package:less6_month3/data/local/app_database.dart';

class TodoBottomSheet {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  TodoBottomSheet(context, {TodoModelData? todo}) {
    if (todo != null) {
      titleController.text = todo.title;
      descController.text = todo.description;
    }
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          children: [
            Text(todo == null ? 'Add' : 'Edit'),
            TextField(controller: titleController),
            TextField(controller: descController, maxLines: 5),
            ElevatedButton(
              onPressed: () {
                if (todo == null) {
                  context.read<TodoCubit>().addTodo(
                    titleController.text,
                    descController.text,
                  );
                } else {
                  context.read<TodoCubit>().editTodo(
                    TodoModelData(
                      id: todo.id,
                      title: titleController.text,
                      description: descController.text,
                      done: todo.done,
                    ),
                  );
                }
                Navigator.pop(context);
              },
              child: Text(todo == null ? 'Add' : 'Edit'),
            ),
          ],
        );
      },
    );
  }
}
