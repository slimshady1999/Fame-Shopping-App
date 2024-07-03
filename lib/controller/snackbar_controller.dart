import 'package:flutter/material.dart';
import 'package:get/get.dart';

final hideSnackbar = ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

class CustomSnackBarMessages {
  //-- addToCartSnackbar
  static addToCartSnackbar(String title, String message) {
    return Get.showSnackbar(GetSnackBar(
      title: title,
      message: message,
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.red,
      borderRadius: 10,
      isDismissible: false,
      dismissDirection: DismissDirection.horizontal,
    ));
  }

  //-- errorSnackBar
  static errorSnackBar({required String title, required String message}) {
    return Get.showSnackbar(GetSnackBar(
      title: title,
      message: message,
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.red,
      borderRadius: 10,
      isDismissible: false,
      dismissDirection: DismissDirection.horizontal,
    ));
  }
}
