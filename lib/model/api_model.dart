class ProductsModel {
  final String? title;
  final double? price;
  final String? image;
  final String? description;

  //-- ProductModel Constructor
  ProductsModel({this.title, this.price, this.image, this.description});

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    final jsonData = json;

    return ProductsModel(
      title: jsonData["title"] ?? "",
      price: jsonData["price"]?.toDouble() ?? 0.0,
      image: jsonData["image"] ?? "",
      description: jsonData["description"] ?? "",
    );
  }
}
