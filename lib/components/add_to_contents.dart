import 'package:flutter/material.dart';
class AddToContents extends StatelessWidget {
  String text ;
  var controller ;
   AddToContents({this.controller,required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      textDirection: TextDirection.ltr,
      style: const TextStyle(fontSize: 15,color: Colors.black),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.grey,)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.grey)),
        hintText: text ,
        hintStyle: const TextStyle(fontSize: 15),
        hintTextDirection: TextDirection.ltr,

      ),

    );
  }
}
