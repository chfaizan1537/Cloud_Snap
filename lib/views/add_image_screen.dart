import 'package:cloud_snap4/controllers/add_image_controller.dart';
import 'package:cloud_snap4/widgets/custom_elevated_button.dart';
import 'package:cloud_snap4/widgets/custom_text.dart';
import 'package:cloud_snap4/widgets/custom_textfield.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/custom_icon.dart';

class AddImageScreen extends StatefulWidget {
  const AddImageScreen({super.key});

  @override
  State<AddImageScreen> createState() => _AddImageScreenState();
}

class _AddImageScreenState extends State<AddImageScreen> {
  final addimagecont = Get.put(AddImageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
        title: CustomText(
          textchild: 'Upload Image',
          style: GoogleFonts.playfairDisplay(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Obx(
              () => GestureDetector(
                onTap: () {
                  addimagecont.pickImage(ImageSource.camera);
                },
                child: Padding(
                  padding: EdgeInsetsGeometry.all(10),
                  child: DottedBorder(
                    options: RectDottedBorderOptions(
                      dashPattern: [10, 10],
                      strokeWidth: 1,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: addimagecont.pickedImage.value == null
                          ? Container(
                              height: 350,
                              width: double.infinity,
                              alignment: Alignment.center,
                              child:  Column(
                                mainAxisAlignment: .center,
                                children: [
                                  CustomIcon(color: Colors.black,
                                      icon: CupertinoIcons.camera, size: 40),
                                 CustomText(textchild: 'Tap to select image', style: GoogleFonts.playfairDisplay(
                                   fontSize: 25,
                                   fontWeight: FontWeight.bold
                                 ))
                                ],
                              )
                            )
                          : Image.file(
                              addimagecont.pickedImage.value!,
                              height: 300,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsetsGeometry.only(left: 15, right: 15),
              child: CustomTextfield(
                controller: addimagecont.title,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue.shade400),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),

                  hintText: 'Enter Title',
                  prefixIcon: CustomIcon(
                    color: Colors.indigo,
                    icon: Icons.drive_file_rename_outline,
                    size: 30,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsetsGeometry.only(left: 15, right: 15),
              child: CustomTextfield(
                controller: addimagecont.description,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 100, left: 10),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue.shade400),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),

                  hintText: 'Enter Description',
                  prefixIcon: CustomIcon(
                    color: Colors.indigo,
                    icon: Icons.description_outlined,
                    size: 30,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 50,
              width: 250,
              child: CustomElevatedButton(
                styling: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                  backgroundColor: Colors.indigoAccent,
                ),
                onpressed: () {
                  addimagecont.adddetail(
                    addimagecont.title.text,
                    addimagecont.description.text,
                  );
                },

                child: CustomText(
                  textchild: 'Upload Pic',
                  style: GoogleFonts.playfairDisplay(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
