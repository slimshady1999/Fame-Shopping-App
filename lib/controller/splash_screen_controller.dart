import 'package:fame/controller/network_controller.dart';
import 'package:fame/controller/snackbar_controller.dart';
import 'package:fame/view/dashboard/home_screen.dart';
import 'package:get/get.dart';

class SplashPageController extends GetxController {
  final networkController = Get.put(NetworkManager());

  @override
  void onReady() {
    super.onReady();
    splashPageLoader();
  }

  Future<void> splashPageLoader() async {
    try {
      //-- Delay timer
      Future.delayed(const Duration(seconds: 5));

      //-- check for internet access
      final isConnected = await networkController.checkInternetConnection();
      if (!isConnected) {
        networkController.hasConnection.value = false;
        CustomSnackBarMessages.errorSnackBar(
          title: "Slow or No Internet Connection",
          message: "Please check your internet connection",
        );
      }

      //-- Navigate to onboarding Screen
      Get.offAll(() => const HomePageScreen());
    } catch (e) {
      CustomSnackBarMessages.errorSnackBar(
          title: "Slow or No Internet Connection",
          message: "Please check your internet connection");
    }
  }
}
