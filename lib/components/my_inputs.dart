import 'package:flutter/material.dart';

class MyInput extends StatelessWidget {
  String hintText;
  bool obscureText;
  TextEditingController controller;

  MyInput({
    Key? key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(border: OutlineInputBorder())),
    );
  }
}

