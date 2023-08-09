class Product {

  String? name;
  int? price;
  String? imagePath;

  Product({this.name, this.price, this.imagePath});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    imagePath = json['image_path'];
  }

}
