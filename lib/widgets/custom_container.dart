import 'package:flutter/material.dart';
class CustomContainer extends StatelessWidget {
 final Widget child;
 final Decoration? decoration;
 final double? height;
 final double? width;

  CustomContainer({required this.child, this.decoration, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      height: height,
      width: width,
      child: child,


    );
  }
}
