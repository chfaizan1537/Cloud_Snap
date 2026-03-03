import 'package:cloud_snap4/routes/routes_initilization.dart';
import 'package:cloud_snap4/routes/routes_names.dart';
import 'package:cloud_snap4/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async{
  await Supabase.initialize(
    url: 'https://klblgqijzpetxxcbdtft.supabase.co',
    anonKey: 'sb_publishable_irsx5vfIdYB80mFeRcAXYg_onq3QaOV',
  );
  runApp(const mainScreen());
}

class mainScreen extends StatelessWidget {
  const mainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: RoutesNames.splash,
      getPages:RoutesInitilization.pages,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

