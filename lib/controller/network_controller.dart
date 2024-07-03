import 'dart:io';
import 'package:fame/controller/snackbar_controller.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController {
  //-- variables
  Rx<bool> hasConnection = false.obs;

  //-- function to check for internet connection
  Future<bool> checkInternetConnection() async {
    try {
      final internetConnection = await InternetAddress.lookup('www.google.com');
      if (internetConnection.isNotEmpty &&
          internetConnection[0].rawAddress.isNotEmpty) {
        hasConnection.value = true;
      } else {
        hasConnection.value = false;
        CustomSnackBarMessages.errorSnackBar(
          title: "Slow or No Internet",
          message: "Please check your internet connection",
        );
      }
    } on SocketException catch (_) {
      hasConnection.value = false;
      CustomSnackBarMessages.errorSnackBar(
          title: "Slow or No Internet",
          message: "Please check your internet connection");
    }
    return hasConnection.value;
  }
}
