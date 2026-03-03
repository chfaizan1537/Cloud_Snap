import 'package:flutter/material.dart';
class CustomElevatedButton extends StatelessWidget {
 final void Function() onpressed;
 final ButtonStyle styling;
 final Widget child;
 const CustomElevatedButton({required this.styling,super.key,required this.onpressed,required this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed:onpressed ,
        style: styling,
        child: child,
    );

  }
}

