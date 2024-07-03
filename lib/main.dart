import 'package:fame/controller/getx_state_initializer.dart';
import 'package:fame/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  //-- Bind flutters Widgets for all platforms
  WidgetsFlutterBinding.ensureInitialized();

  //-- Getx States Initialize
  getxInit();

  runApp(const GetMaterialApp(
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
