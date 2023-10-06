import 'package:flutter/material.dart';
class MyText extends StatelessWidget {
  String text ;
  Color color ;
  double size ;
  bool isBold = false;
   MyText({required this.size,required this.color,required this.isBold,required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,style:TextStyle(color: color,fontSize: size,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal ,),);
  }
}
