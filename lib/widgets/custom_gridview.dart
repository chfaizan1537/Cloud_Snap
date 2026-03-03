import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
class CustomGridview extends StatelessWidget {
  final int iteamcount;
  final Widget child;
 CustomGridview({super.key,required this.iteamcount,required this.child});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),

         itemCount: iteamcount,
        itemBuilder: (context, index) {
          return child;
        },);
  }
}
