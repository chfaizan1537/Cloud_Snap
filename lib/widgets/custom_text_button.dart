import 'package:flutter/material.dart';
class CustomTextButton extends StatelessWidget {
  final Function() onpressed;
 final ButtonStyle? style;
  final Widget child;
   CustomTextButton({super.key,required this.onpressed,required this.child,this.style});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style:style,
        onPressed:onpressed , child: child);
  }
}
