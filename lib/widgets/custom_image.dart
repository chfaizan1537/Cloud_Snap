import 'package:flutter/material.dart';
class CustomImage extends StatelessWidget {
 final ImageProvider image;
 final double height;
 final double width;
final BoxFit fit;
  CustomImage({super.key,required this.image,required this.width,required this.height,required this.fit});

  @override
  Widget build(BuildContext context) {
    return Image(image: image,height: height,fit: fit,width: width,);
  }
}
