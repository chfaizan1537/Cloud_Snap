import 'package:cloud_snap4/routes/routes_names.dart';
import 'package:cloud_snap4/views/add_image_screen.dart';
import 'package:cloud_snap4/views/home_screen.dart';
import 'package:cloud_snap4/views/register_screen.dart';
import 'package:get/get.dart';

import '../views/image_detail_screen.dart';
import '../views/signin_screen.dart';
import '../views/splash_screen.dart';

class RoutesInitilization {
  static final pages = [
    GetPage(name: RoutesNames.splash, page: () => SplashScreen()),
    GetPage(name: RoutesNames.signin, page: () => SigninScreen()),
    GetPage(name: RoutesNames.homescreen, page: () => HomeScreen()),
    GetPage(name: RoutesNames.registerscreen, page: () => RegisterScreen()),
    GetPage(name: RoutesNames.addimagescreen, page: () => AddImageScreen()),
    GetPage(name: RoutesNames.imagedetailscreen, page: () => ImageDetailScreen()),


  ];
}
