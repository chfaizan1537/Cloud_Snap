import 'package:cloud_snap4/routes/routes_names.dart';
import 'package:cloud_snap4/widgets/custom_container.dart';
import 'package:cloud_snap4/widgets/custom_icon.dart';
import 'package:cloud_snap4/widgets/custom_icon_button.dart';
import 'package:cloud_snap4/widgets/custom_image.dart';
import 'package:cloud_snap4/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/date_time_patterns.dart';

import '../controllers/add_image_controller.dart';

class ImageDetailScreen extends StatefulWidget {
  const ImageDetailScreen({super.key});

  @override
  State<ImageDetailScreen> createState() => _ImageDetailScreenState();
}

class _ImageDetailScreenState extends State<ImageDetailScreen> {
  final current = Get.arguments;
  final AddImageController contr=Get.put(AddImageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: CustomImage(
                  image: NetworkImage('${current['imagelink']}'),
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 500,
                ),
              ),
            ],
          ),
          Positioned(
            top: 20,
            left: 10,
            child: Row(
              children: [
                CustomIconButton(
                  icon: CustomIcon(
                    color: Colors.white,
                    icon: Icons.arrow_back,
                    size: 35,
                  ),
                  onpressed: () {
                    Get.offNamed(RoutesNames.homescreen);
                  },
                  style: ButtonStyle(),
                ),
              ],
            ),
          ),
          Positioned(
            top: 450,
            left: 0,
            right: 0,
            child: CustomContainer(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadiusGeometry.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 30),
                      CustomText(
                        textchild: '${current['title']}',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30,),
                  Padding(

                    padding: EdgeInsetsGeometry.only(left: 5,right: 5),
                    child: Row(
                      mainAxisAlignment: .spaceEvenly,
                      children: [
                        CustomContainer(
width: 170,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadiusGeometry.circular(20),

                          ),

                          child: Padding(
                            padding: EdgeInsetsGeometry.all(10),
                            child: Column(
                              mainAxisAlignment: .spaceEvenly,
                              crossAxisAlignment: .start,
                              children: [
                                CustomIcon(
                                  color: Colors.black,
                                  icon: Icons.calendar_today,
                                  size: 25,
                                ),
                                CustomText(
                                  textchild: DateFormat('MMMM dd, yyyy')
                                      .format(DateTime.parse(current['created_at'])),
                                  style: GoogleFonts.playfairDisplay(
                                    fontSize: 20,
                                    color: Colors.black
                                  ),
                                ),
                                CustomText(textchild: 'Date', style: GoogleFonts.playfairDisplay(
                                    fontSize: 20
                                ))
                              ],
                            ),
                          ),
                        ),

                        CustomContainer(
                          width: 150,

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadiusGeometry.circular(15),

                          ),

                          child: Padding(
                            padding: EdgeInsetsGeometry.all(10),
                            child: Column(
                              mainAxisAlignment: .spaceEvenly,
                              crossAxisAlignment: .start,
                              children: [
                                CustomIcon(
                                  color: Colors.black,
                                  icon: Icons.description_outlined,
                                  size: 25,
                                ),
                                CustomText(
                                  textchild:'${current['description']}',
                                  style: GoogleFonts.playfairDisplay(
                                      fontSize: 20,
                                      color: Colors.black
                                  ),
                                ),
                                CustomText(textchild: 'Description', style: GoogleFonts.playfairDisplay(
                                    fontSize: 20
                                ))
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(

                    padding: EdgeInsetsGeometry.only(left: 5,right: 5),
                    child: Row(
                      mainAxisAlignment: .spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
    await Share.share(
    current['imagelink'], // Network image URL
    subject: current['title'],
    );
    },
                          child: CustomContainer(
                            width: 150,
                            height: 90,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              borderRadius: BorderRadiusGeometry.circular(20),
                              border: Border.all(
                                color: CupertinoColors.activeBlue
                              )

                            ),

                            child: Padding(
                              padding: EdgeInsetsGeometry.all(10),
                              child: Column(
                                mainAxisAlignment: .spaceEvenly,
                                crossAxisAlignment: .center,
                                children: [
                                  CustomIcon(
                                    color: CupertinoColors.activeBlue,
                                    icon: Icons.share,
                                    size: 30,
                                  ),
                                  CustomText(textchild: 'Share', style: GoogleFonts.playfairDisplay(
                                      fontSize: 20
                                  ))
                                ],
                              ),
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            contr.deletepic(current['imagelink'],current['id']);
                          },
                          child: CustomContainer(
                            width: 150,
                            height: 90,
                            decoration: BoxDecoration(
                              color: Colors.red.shade50,
                              borderRadius: BorderRadiusGeometry.circular(15),
                              border: Border.all(
                                color: Colors.red
                              )

                            ),

                            child: Padding(
                              padding: EdgeInsetsGeometry.all(10),
                              child: Column(
                                mainAxisAlignment: .spaceEvenly,
                                crossAxisAlignment: .center,
                                children: [
                                  CustomIcon(
                                    color: Colors.red,
                                    icon: CupertinoIcons.delete,
                                    size: 30,
                                  ),

                                  CustomText(textchild: 'Delete', style: GoogleFonts.playfairDisplay(
                                      fontSize: 20
                                  ))
                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
