import 'package:fame/controller/api_services_controller.dart';
import 'package:fame/view/dashboard/product_details_screen.dart';
import 'package:fame/view/dashboard/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageScreen extends GetView<ProductDataController> {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductDataController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.red,
        title: const Text(
          "Fame Mug",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        actions: [
          //-- Refresh Button
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 19.5,
                child: IconButton(
                    onPressed: () {
                      controller.fetchProductDta();
                    },
                    icon: const Icon(
                      Icons.refresh_rounded,
                      color: Colors.red,
                    ))),
          ),

          //-- Cart Button
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 17.7,
                child: Icon(
                  Icons.shopping_basket,
                  color: Colors.red,
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            children: [
              //-- Discount Ads
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(48, 244, 67, 54)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Get Better",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color.fromARGB(255, 94, 94, 94),
                              ),
                            ),
                          ),
                          Text("Discounts...",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.red,
                              )),
                          Text("up to 50% OFF!",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 94, 94, 94),
                              )),
                        ],
                      ),
                    ),

                    //-- Discount Image
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child:
                          Image.asset("assets/fame.png", height: 85, width: 85),
                    )
                  ],
                ),
              ),

              //-- Products
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //-- Products Button
                  const Padding(
                    padding: EdgeInsets.only(left: 12.5),
                    child: Text("Products",
                        style: TextStyle(
                            fontSize: 15.5,
                            color: Color.fromARGB(255, 94, 94, 94))),
                  ),

                  //-- Visit Store Button
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const ShopScreen());
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red,
                      ),
                      child: const Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          "Visit Store",
                          style: TextStyle(
                              fontSize: 12.5,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              //--  Limited Products from APIs
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: SizedBox(
                  child: Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(
                          child: CircularProgressIndicator(color: Colors.red));
                    } else {
                      if (controller.productstList.isEmpty) {
                        return const Center(child: Text('No products found'));
                      }
                      return GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.only(
                              bottom: 20, left: 10, right: 10),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                          ),
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => ProductDetailsScreen(
                                    productDataDetails:
                                        controller.productstList[index]));
                              },
                              child: Card(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(children: [
                                    //-- Image
                                    Expanded(
                                      child: Image.network(controller
                                          .productstList[index].image
                                          .toString()),
                                    ),

                                    //-- Product Title
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 5, right: 5, bottom: 5, top: 7),
                                      height: 20,
                                      width: double.infinity,
                                      child: Center(
                                        child: Text(
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            controller
                                                .productstList[index].title
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 11,
                                                color: Color.fromARGB(
                                                    255, 99, 99, 99))),
                                      ),
                                    ),

                                    //-- Product Prices
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 7,
                                      ),
                                      child: Text(
                                          "\$${controller.productstList[index].price}",
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w800,
                                              color: Color.fromARGB(
                                                  255, 99, 99, 99))),
                                    )
                                  ]),
                                ),
                              ),
                            );
                          });
                    }
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
