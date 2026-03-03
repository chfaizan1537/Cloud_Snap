import 'package:cloud_snap4/controllers/signin_controller.dart';
import 'package:cloud_snap4/routes/routes_names.dart';
import 'package:cloud_snap4/widgets/custom_container.dart';
import 'package:cloud_snap4/widgets/custom_elevated_button.dart';
import 'package:cloud_snap4/widgets/custom_icon.dart';
import 'package:cloud_snap4/widgets/custom_text.dart';
import 'package:cloud_snap4/widgets/custom_text_button.dart';
import 'package:cloud_snap4/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final signincontroller = Get.put(SigninController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 120),
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
                  textchild: 'Welcome Back',
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
                  textchild: 'Signin to access your photos',
                  style: GoogleFonts.playfairDisplay(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
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
            SizedBox(height: 20),
            // textfield
            Padding(
              padding: EdgeInsetsGeometry.only(left: 15, right: 15),
              child: CustomTextfield(
                controller: signincontroller.email,
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
            SizedBox(height: 20),
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
            SizedBox(height: 20),
            //textfield
            Padding(
              padding: EdgeInsetsGeometry.only(left: 15, right: 15),
              child: CustomTextfield(

                controller: signincontroller.password,
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
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: .end,
              children: [
              CustomTextButton(onpressed: (){
                Get.toNamed(RoutesNames.registerscreen);
              }, child: Text('Not have an account ? Register',style: TextStyle(color: Colors.blue),), )
            ],),
            SizedBox(height: 30),

            // login button
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
                  signincontroller.login();
                },
                child: CustomText(
                  textchild: 'Login',
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
