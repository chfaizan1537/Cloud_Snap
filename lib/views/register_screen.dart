import 'package:cloud_snap4/controllers/signin_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/register_controller.dart';
import '../routes/routes_names.dart';
import '../widgets/custom_container.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_icon.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_textfield.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final registercontroller=Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:40),
            //icon
            Row(
              children: [
                SizedBox(width: 15),
                CustomContainer(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: AlignmentGeometry.topLeft,
                      end: AlignmentGeometry.bottomRight,
                      colors: [Colors.indigo, Colors.blue],
                    ),
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                  height: 70,
                  width: 70,
                  child: CustomIcon(
                    color: Colors.white,
                    icon: CupertinoIcons.photo,
                    size: 40,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // welcomtext
            Row(
              children: [
                SizedBox(width: 15),
                CustomText(
                  textchild: 'Create Account',
                  style: GoogleFonts.playfairDisplay(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            // descrip text
            Row(
              children: [
                SizedBox(width: 20),
                CustomText(
                  textchild: 'Join Cloud Snap today',
                  style: GoogleFonts.playfairDisplay(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            // name text
            Row(
              children: [
                SizedBox(width: 20),
                CustomText(
                  textchild: 'Name',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            //name textfield
            Padding(
              padding: EdgeInsetsGeometry.only(left: 15, right: 15),
              child: CustomTextfield(
                controller: registercontroller.name,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue.shade400),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
        
                  hintText: 'Enter Name',
                  prefixIcon: CustomIcon(
                    color: Colors.indigo,
                    icon: Icons.email_outlined,
                    size: 30,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            //email tex
            Row(
              children: [
                SizedBox(width: 20),
                CustomText(
                  textchild: 'Email',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // textfield
            Padding(
              padding: EdgeInsetsGeometry.only(left: 15, right: 15),
              child: CustomTextfield(
                controller: registercontroller.email,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue.shade400),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
        
                  hintText: 'Enter email',
                  prefixIcon: CustomIcon(
                    color: Colors.indigo,
                    icon: Icons.email_outlined,
                    size: 30,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            //pass text
            Row(
              children: [
                SizedBox(width: 20),
                CustomText(
                  textchild: 'Password',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            //textfield
            Padding(
              padding: EdgeInsetsGeometry.only(left: 15, right: 15),
              child: CustomTextfield(
                controller: registercontroller.password,
                decoration: InputDecoration(
                  enabled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue.shade400),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
        
                  hintText: 'Enter Password',
                  prefixIcon: CustomIcon(
                    color: Colors.indigo,
                    icon: Icons.lock_outline,
                    size: 30,
                  ),
                ),
              ),
            ),
            //confirm pass text
            Row(
              children: [
                SizedBox(width: 20),
                CustomText(
                  textchild: 'Confirm Password',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            //textfield
            Padding(
              padding: EdgeInsetsGeometry.only(left: 15, right: 15),
              child: CustomTextfield(
                controller: registercontroller.confirmpassword,
                decoration: InputDecoration(
                  enabled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue.shade400),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
        
                  hintText: 'Confirm Password',
                  prefixIcon: CustomIcon(
                    color: Colors.indigo,
                    icon: Icons.lock_outline,
                    size: 30,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: .end,
              children: [
                CustomTextButton(onpressed: (){
                  Get.toNamed(RoutesNames.signin);
                }, child: Text('Already have an account ?Login',style: TextStyle(color: Colors.blue),), )
              ],),
            SizedBox(height: 30),
        
            // signup button
            SizedBox(
              height: 50,
              width: 330,
              child: CustomElevatedButton(
                styling: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10)
        
                    ),
                    backgroundColor: Colors.indigoAccent
                ),
                onpressed: () {
                  registercontroller.signup();
                },
                child: CustomText(
                  textchild: 'Signup',
                  style: GoogleFonts.playfairDisplay(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25
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
