import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:less6_month3/data/local/app_database.dart';
import 'package:less6_month3/ui/widget/todo_bottom_sheet.dart';

class TodoCard extends StatefulWidget {
  const TodoCard({super.key, required this.todoModel});
  final TodoModelData todoModel;

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  bool done = false;

  @override
  void initState() {
    super.initState();
    done = widget.todoModel.done;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: done ? Colors.grey : Color(0xFF5566FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  widget.todoModel.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    decoration: done ? TextDecoration.lineThrough : null,
                  ),
                ),
                Spacer(),
                IconButton(onPressed: () => setState(() => done = !done), 
                icon: Icon(
                  done ? Icons.check_box : Icons.check_box_outline_blank,
                  color: Colors.white,
                )
                ),
                IconButton(
                  onPressed: () {
                    TodoBottomSheet(context);
                  },
                  icon: Icon(Icons.edit, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('внимание'),
                          content: Text('вы уверены'),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ButtonStyle(
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.redAccent),
                                    borderRadius: BorderRadiusGeometry.circular(
                                      12,
                                    ),
                                  ),
                                ),
                              ),
                              child: Text(
                                'отменить',
                                style: TextStyle(color: Colors.redAccent),
                              ),
                            ),
                            ElevatedButton(onPressed: (){
                              Navigator.pop(context);
                            }, 
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                Color(0xFF5566FF),
                              ),
                              foregroundColor: WidgetStateProperty.all(
                                Colors.white
                              ),
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                )
                              )
                            ),
                            child: Text('удалить'))
                          ],
                          
                        );
                        
                      },
                      
                    );
                    
                    //context.read<TodoCubit>().delete(widget.todoModel.id);
                  },
                  icon: Icon(Icons.delete, color: Colors.white,),
                ),
              ],
            ),
            Text(widget.todoModel.description,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w200,
            ),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
