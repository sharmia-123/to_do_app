import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {

  final String taskname;
  final bool taskcompleted;
  final Function(bool?)? onChanged;
  final void Function(BuildContext)? deleteFunction;

  const ToDoTile({super.key,

  required this.taskname,
  required this.taskcompleted,
  required this.onChanged,
  required this.deleteFunction,
  
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
    child: Slidable(
      endActionPane: ActionPane(motion: StretchMotion(),
      children: [
        SlidableAction(onPressed: deleteFunction,
        icon: Icons.delete,
        backgroundColor: Colors.red.shade300,
        borderRadius: BorderRadius.circular(12),
        ),
      ]),
      child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.yellow,
      ),
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: [
          Checkbox(
            activeColor: Colors.black,
            value: taskcompleted, onChanged: onChanged),
            Text(taskname, style: TextStyle(
            decoration: taskcompleted
            ? TextDecoration.lineThrough
            : TextDecoration.none,
            ),),
       ],
      ),
     ),),
    );
  }
}