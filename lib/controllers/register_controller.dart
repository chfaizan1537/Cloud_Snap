import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
class RegisterController extends GetxController {
  final name=TextEditingController();
  final email=TextEditingController();
  final password=TextEditingController();
  final confirmpassword=TextEditingController();
  void signup() async {
    final supabase = Supabase.instance.client;
    try {
      if (email.text.isEmpty && password.text.isEmpty) {
        Get.snackbar(
          'Error ',
          'Please enter required fields',
          colorText: Colors.white,
          backgroundColor: Colors.red.shade300,
        );
      } else {
        await supabase.auth.signUp(password: password.text, email: email.text);
        savename();
        Get.snackbar(
          'Success',
          'Account created successfully',
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error ',
        '${e}',
        backgroundColor: Colors.red.shade400,
        colorText: Colors.white,
      );
    }
  }
  void savename()async {
    final supabase = Supabase.instance.client;
    if (name.text.isEmpty) {
      Get.snackbar('Error', 'Please enter name');
    }
    try {

    await supabase.from('details').insert({
    'name': name.text
    });


  } catch(e){
Get.snackbar('Error', '${e.toString()}',
backgroundColor: Colors.red.shade400,
  colorText: Colors.white
);

    }
  }


}