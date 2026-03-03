import 'package:flutter/material.dart';
class CustomTextfield extends StatelessWidget {

  final TextEditingController controller;
  final InputDecoration decoration;
   CustomTextfield({super.key,required this.controller,required this.decoration});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration:decoration,

    );
  }
}
