import 'package:fame/controller/snackbar_controller.dart';
import 'package:fame/model/api_model.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
    required this.productDataDetails,
  });
  final ProductsModel productDataDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //-- app bar
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.red,
          title: const Text(
            "Product Details",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 17.7,
                  child: Icon(
                    Icons.shopping_basket,
                    color: Colors.red,
                  )),
            )
          ],
        ),

        //-- Add to cart bottom app bar
        bottomNavigationBar: BottomAppBar(
          child: GestureDetector(
            onTap: () {
              CustomSnackBarMessages.addToCartSnackbar(
                  "Added to Cart", "Successfully");
            },
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
              ),
              child: const Center(
                child: Text("ADD TO CART",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //-- Image
              Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  height: MediaQuery.of(context).size.height / 2.3,
                  width: double.infinity,
                  child: Image.network(productDataDetails.image.toString())),

              //-- Original Store banner
              Container(
                margin: const EdgeInsets.only(left: 10, bottom: 10, top: 15),
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                ),
                child: const Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "Original Store",
                    style: TextStyle(fontSize: 12.5, color: Colors.white),
                  ),
                ),
              ),

              //-- Title
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Text(
                  textAlign: TextAlign.left,
                  productDataDetails.title.toString(),
                  style: const TextStyle(fontSize: 16),
                ),
              ),

              //-- Price
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 30,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(125, 244, 67, 54),
                    ),
                    child: const Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        "Price",
                        style: TextStyle(fontSize: 12.5, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      textAlign: TextAlign.center,
                      "\$${productDataDetails.price.toString()}",
                      style: const TextStyle(
                          color: Color.fromARGB(255, 97, 97, 97),
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),

              //-- Description
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                child: Text(
                  textAlign: TextAlign.left,
                  productDataDetails.description.toString(),
                  style: const TextStyle(
                    fontSize: 14.5,
                    color: Color.fromARGB(255, 97, 97, 97),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
