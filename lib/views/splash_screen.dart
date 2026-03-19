import 'package:cloud_snap4/routes/routes_names.dart';
import 'package:cloud_snap4/widgets/custom_container.dart';
import 'package:cloud_snap4/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(
      seconds: 4
    ),() {
Get.toNamed(RoutesNames.signin);
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: AlignmentGeometry.topLeft,
end: AlignmentGeometry.bottomRight,
            colors: [
          Colors.indigo.shade600,
          Colors.blue.shade300
        ])
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
body: Center(
  child: CustomContainer(

      child: Column(
        mainAxisAlignment: .center,
        children: [
          Lottie.asset('assets/animations/splash.json',height: 300),

CustomText(textchild: 'Cloud Snap',style: GoogleFonts.playfairDisplay(
  fontSize: 50,
  fontWeight: FontWeight.bold,
  color: Colors.white
),)
      ],)
),
      ),
    ));

}
}