import 'package:flutter/material.dart';
class CustomIcon extends StatelessWidget {
 final IconData icon;
 final Color color;
 final double size;
  CustomIcon({super.key,required this.color,required this.icon,required this.size});

  @override
  Widget build(BuildContext context) {
    return Icon(icon,color: color,size: size,);
  }
}
