import 'package:flutter/material.dart';
import 'my_text.dart';
class CustomButton extends StatelessWidget {
  String text ;
  var func ;
  double width ;
   CustomButton({this.func,required this.width,required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color(0xff7cbf86)
      ),
      child: MaterialButton(
        onPressed: func,
        child: MyText(color: Colors.white,size: 20,isBold: false ,text: text),
      ),
    );
  }
}
