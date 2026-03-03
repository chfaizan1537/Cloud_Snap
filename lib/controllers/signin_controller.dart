import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../routes/routes_names.dart';
class SigninController extends GetxController {
  final email =TextEditingController();
  final password =TextEditingController();

  void login()async{
    final supabase=Supabase.instance.client;
    try{
      final response= await supabase.auth.signInWithPassword(
          password: password.text,
          email: email.text);

      if(response.user!=null){
        Get.snackbar('Success', 'Login Successfully',
            backgroundColor: Colors.green,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP);
        Get.offNamed(RoutesNames.homescreen);

      }
      else {
        Get.snackbar(
          'Error',
          'Login failed. No user returned.',
          backgroundColor: Colors.red.shade400,
          colorText: Colors.white,
        );
      }

    }
    catch(e){
      Get.snackbar('Error ', '${e}',
        backgroundColor: Colors.red.shade400,
        colorText: Colors.white,);
    }

  }
  void logout()async{
    final supabase=Supabase.instance.client;
    await supabase.auth.signOut();
    Get.offNamed(RoutesNames.signin);
  }

}