import 'dart:convert';
import 'package:fame/controller/network_controller.dart';
import 'package:fame/controller/snackbar_controller.dart';
import 'package:fame/model/api_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

//- Api serves for fetching data
class ApiServicesController {
  //-- Variables
  final apiUrl = "https://fakestoreapi.com/products";

  List<ProductsModel> productsModelList = [];

  //-- function to call Api
  Future<List<ProductsModel>?> fetchApiData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      //-- Check if the response was successful or not
      if (response.statusCode == 200) {
        final apiData = response.body;
        return (json.decode(apiData) as List)
            .map((post) => ProductsModel.fromJson(post))
            .toList();
      } else {
        //-- Throw Server error
        throw CustomSnackBarMessages.errorSnackBar(
            title: "Server time out",
            message: "slow or no internet connection");
      }
    } catch (e) {
      //-- Throw Server error
      throw CustomSnackBarMessages.errorSnackBar(
        title: "Server time out",
        message: "slow or no internet connection",
      );
    }
  }
}

//-- ProductData Controller to manage the state of the application
//--  (Involves loading boolean values, observable variables, network state)
class ProductDataController extends GetxController {
  var isLoading = true.obs;
  var productstList = <ProductsModel>[].obs;

  final networkController = Get.put(NetworkManager());

  @override
  void onInit() {
    fetchProductDta();
    super.onInit();
  }

  fetchProductDta() async {
    try {
      isLoading(true);

      //-- check for internet connection
      final connected = await networkController.checkInternetConnection();
      if (!connected) {
        //-- Throw Server error
        CustomSnackBarMessages.errorSnackBar(
          title: "Server time out",
          message: "slow or no internet connection",
        );
        return networkController.hasConnection.value = false;
      }

      var productData = await ApiServicesController().fetchApiData();
      // ignore: unnecessary_null_comparison
      if (productData != null) {
        productstList.assignAll(productData);
      }
    } finally {
      isLoading(false);
    }
  }
}
