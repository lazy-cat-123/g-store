// Test with mock product api adapter
// to check if the fatching logic work

import 'package:flutter_test/flutter_test.dart';
import 'package:app/data/adapters/product_api_adapter.dart';
import 'package:app/data/repositories/product_repository_impl.dart';
import 'package:app/domain/repositories/product_repository.dart';

class MockProductApiAdapter implements ProductApiAdapter {
  @override
  Future<List<Map<String, dynamic>>> fetchProducts() async {
    return [
      {'id': '1', 'name': 'Test Product 1', 'price': '10.00', 'description': ", 'imageUrl':"},
      {'id': '2', 'name': 'Test Product 2', 'price': '20.00', 'description': ", 'imageUrl':"}
    ];
  }
}

void main() {
  group('ProductRepositoryImpl', () {
    test ('should return a list of products when the call is successful', () async {
      final mockApiAdapter = MockProductApiAdapter();
      final repository = ProductRepositoryImpl(mockApiAdapter);

      final products = await repository.getProducts();

      expect(products, isA<List<Product>>());
      expect(products.length, 2);
      expect(products.first.name, 'Test Product 1');
    });
  });
}