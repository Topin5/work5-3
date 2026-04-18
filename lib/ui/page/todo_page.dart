import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:less6_month3/cubit/todo_cubit.dart';
import 'package:less6_month3/cubit/todo_state.dart';
import 'package:less6_month3/ui/widget/todo_bottom_sheet.dart';
import 'package:less6_month3/ui/widget/todo_card.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todos'), centerTitle: false),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state is TodoLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is TodoSuccessState) {
            return Column(
              children: [
                TextField(
                  onChanged: (value) {
                    context.read<TodoCubit>().search(value);
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) {
                      return TodoCard(todoModel: state.todos[index]);
                    },
                  ),
                ),
              ],
            );
          } else if (state is TodoErrorState) {
            return Center(
              child: Text(state.error, style: TextStyle(fontSize: 24)),
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TodoBottomSheet(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
