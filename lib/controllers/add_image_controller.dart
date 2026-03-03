import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../routes/routes_names.dart';
class AddImageController extends GetxController {
  final title = TextEditingController();
  final description = TextEditingController();
  var pickedImage = Rx<File?>(null);
  String imgurl='';
  Future<void> adddetail(String titl, String desc) async {

    final titleTrimmed = titl.trim();
    final descTrimmed = desc.trim();

    if (titleTrimmed.isEmpty || descTrimmed.isEmpty) {
      Get.snackbar(
        'Error',
        'Title and Description are required',
        backgroundColor: Colors.red.shade400,
        colorText: Colors.white,
      );
      return;
    }
    String? imageUrl;
    if (pickedImage.value != null) {
      imageUrl = await uploadpic();
    }

    try {
      await Supabase.instance.client.from('details').insert({
        'title': titleTrimmed,
        'description': descTrimmed,
        'imagelink': imageUrl,
      });

      Get.snackbar(
        'Success',
        'Feedback submitted successfully',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
      );

      resetForm();
      Get.toNamed(RoutesNames.homescreen);
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red.shade300,
        colorText: Colors.white,
      );
    }
  }

  Future pickImage(ImageSource source) async {
    try {
      final result = await ImagePicker().pickImage(source: source);
      if (result != null) {
        pickedImage.value = File(result.path);
      }
    } catch (e) {
      Get.snackbar('Error', '$e');
    }
  }


   uploadpic() async {
  final  fileName = 'image_${DateTime.now().millisecondsSinceEpoch}.jpg';
    try {
      await Supabase.instance.client.storage
          .from('images')
          .upload('$fileName', pickedImage.value!);
      imgurl = Supabase.instance.client.storage
          .from('images')
          .getPublicUrl(fileName);
      return imgurl;
    } catch (e) {
      Get.snackbar(
        'Error',
        "$e",
        backgroundColor: Colors.red.shade300,
        colorText: Colors.white,
      );
    }
  }
  deletepic(String imageUrl, int id) async {
    try {
      // Extract filename from URL
      String fileName = imageUrl.split('/').last;

      // Delete from storage
      await Supabase.instance.client.storage
          .from('images')
          .remove([fileName]);

      // Delete from database using ID (BEST WAY)
      await Supabase.instance.client
          .from('details')
          .delete()
          .eq('id', id);

      Get.offNamed(RoutesNames.homescreen);

      Get.snackbar(
        "Success",
        "Image deleted",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
  void resetForm() {
    title.clear();
    description.clear();
    pickedImage.value = null;
  }


}