import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final String buttonname;
  final void Function()? onTap;

  const MyButton({super.key,

  required this.buttonname,
  required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 80,
        decoration: BoxDecoration(color: Colors.yellow,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 4,       
            offset: const Offset(0, 3),
          ),
        ],
        ),
        child: Center(
          child:  Text(buttonname, textAlign: TextAlign.center,),
        ),
      ), 
    );
  }
}