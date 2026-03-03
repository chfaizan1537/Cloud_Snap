import 'package:cloud_snap4/controllers/fetch_images.dart';
import 'package:cloud_snap4/controllers/signin_controller.dart';
import 'package:cloud_snap4/routes/routes_names.dart';
import 'package:cloud_snap4/widgets/custom_grid.dart';
import 'package:cloud_snap4/widgets/custom_icon.dart';
import 'package:cloud_snap4/widgets/custom_icon_button.dart';
import 'package:cloud_snap4/widgets/custom_text.dart';
import 'package:cloud_snap4/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final fetchimagecontroller=Get.put(FetchImageController());

  final cont=Get.put(SigninController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:CustomIconButton(icon:
      CustomIcon(color: Colors.white, icon: Icons.add, size: 30),
          onpressed: (){
 Get.toNamed(RoutesNames.addimagescreen);


          },

          style: IconButton.styleFrom(
            backgroundColor: Colors.indigo,

          )),
      appBar: AppBar(
        automaticallyImplyLeading: false,
      actions: [
        CustomTextButton(onpressed: (){
          cont.logout();
        }, child: CustomIcon(color:Colors.white, icon: Icons.logout, size: 30)),

      ],
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: CustomText(textchild: 'Cloud Snap', style: GoogleFonts.playfairDisplay(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 25

        )),
      ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          StreamBuilder(
            stream: Supabase.instance.client
                .from('details')
                .stream(primaryKey: ['id']),
            builder: (context, snapshot) {
              final allData = snapshot.data ?? [];

              final dataWithImages = allData
                  .where((item) => item['imagelink'] != null && item['imagelink'] != '')
                  .toList();

              if (dataWithImages.isEmpty) {
                return const Expanded(
                  child: Center(child: Text("No Images Found")),
                );
              }

              return Expanded(
                child: GridView.builder(
                  itemCount: dataWithImages.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.69,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    final currentItem = dataWithImages[index];

                    return Padding(
                      padding: const EdgeInsets.only(left: 5,right: 5),
                      child: GestureDetector(
                        onTap: (){
             Get.toNamed(RoutesNames.imagedetailscreen,arguments: currentItem);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            currentItem['imagelink'],
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, progress) {
                              if (progress == null) return child;
                              return const Center(child: CircularProgressIndicator());
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.error);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
