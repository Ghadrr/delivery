import 'package:flutter/material.dart';

class MyInput extends StatelessWidget {
  String hintText;
  bool obscureText;

  MyInput({Key? key, required this.hintText, required this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      child: TextField(
          obscureText: obscureText,
          decoration: InputDecoration(border: OutlineInputBorder())),
    );
  }
}
