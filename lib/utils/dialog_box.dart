import 'package:flutter/material.dart';
import 'package:to_do_app/utils/my_button.dart';

class DialogBox extends StatelessWidget {

  final TextEditingController taskcontroller;
  final VoidCallback onsave;
  final VoidCallback oncancel;
  
  const DialogBox({super.key,

  required this.taskcontroller,
  required this.onsave,
  required this.oncancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      backgroundColor: Colors.yellow[300],
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.zero,
        ),
        height: 100,
        child: Column(
          children: [
            TextField(
              controller: taskcontroller,
              decoration: InputDecoration(
                hintText: "Add a new task",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.5,
                    color: Colors.amber,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.5,
                    color: Colors.amber,
                  )
                )
              ),
            ),
            const SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(buttonname: "Save", onTap: onsave),
                const SizedBox(width: 10.0,),
                MyButton(buttonname: "Cancel", onTap: oncancel,),
              ],
            )
          ],
        ),
      ),
    );
  }
}