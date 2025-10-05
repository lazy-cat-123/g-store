// product repository contracts and models
class Product {
  final String id;
  final String name;
  final double price;

  Product({required this.id, required this.name, required this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    // Product ( app_var_name : json[api_var_name]);
    return Product(id: json['id'], name: json['name'], price: double.parse(json['price']));
  }
}

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}
