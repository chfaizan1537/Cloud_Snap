import 'package:cloud_snap4/routes/routes_initilization.dart';
import 'package:cloud_snap4/routes/routes_names.dart';
import 'package:cloud_snap4/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async{
  await dotenv.load(fileName: ".env");

  final supabaseUrl = dotenv.env['SUPABASE_URL']!;
  final supabaseKey = dotenv.env['SUPABASE_ANON_KEY']!;
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
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

