import 'package:fame/controller/network_controller.dart';
import 'package:fame/controller/splash_screen_controller.dart';
import 'package:get/get.dart';

//-- Get States that runs on app start up and continuously running through out the app while
void getxInit() async {
  Get.put(SplashPageController());
  Get.put<NetworkManager>(NetworkManager(), permanent: true);
}
