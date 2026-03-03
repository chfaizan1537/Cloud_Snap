import 'package:flutter/material.dart';
class CustomText extends StatelessWidget {
  String textchild;
  TextStyle style;

  CustomText({super.key,required this.textchild,required this.style});

  @override
  Widget build(BuildContext context) {
    return Text(textchild,style:style,);
  }
}
