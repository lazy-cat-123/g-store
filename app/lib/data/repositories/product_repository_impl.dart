//transform messy json into clean list

import 'package:app/domain/repositories/product_repository.dart';
import 'package:app/data/adapters/product_api_adapter.dart';

class ProductRepositoryImpl implements ProductRepository{
  final ProductApiAdapter _apiAdapter;

  ProductRepositoryImpl(this._apiAdapter);

  @override
  Future<List<Product>> getProducts() async {
    try {
      final List<Map<String, dynamic>> jsonList = await _apiAdapter.fetchProducts();
      final products = jsonList.map((jsonMap) => Product.fromJson(jsonMap)).toList();
      return products;
    } catch (e) {
      throw Exception('Failed to get products');
    }
  }
}
