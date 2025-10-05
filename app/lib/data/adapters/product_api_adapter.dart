import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductApiAdapter {
  final String _baseUrl = 'https://68e2751b8943bf6bb3c697d6.mockapi.io/Products'; // Mock API

  // Fetch product data from API
  Future<List<Map<String, dynamic>>> fetchProducts() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.cast<Map<String, dynamic>>();
    } else{
      throw Exception('Failed to load products from API');
    }
  }
}