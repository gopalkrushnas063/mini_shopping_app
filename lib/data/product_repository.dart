import 'package:dio/dio.dart';
import '../models/product.dart';

class ProductRepository {
  final Dio _dio;

  ProductRepository(this._dio);

  Future<List<Product>> getProducts() async {
    try {
      final response = await _dio.get('products');
      return (response.data as List)
          .map((json) => Product.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw Exception('Failed to load products: ${e.message}');
    }
  }

  Future<Product> getProductById(int id) async {
    try {
      final response = await _dio.get('products/$id');
      return Product.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to load product: ${e.message}');
    }
  }

  Future<List<String>> getCategories() async {
    try {
      final response = await _dio.get('products/');
      return (response.data as List).cast<String>();
    } on DioException catch (e) {
      throw Exception('Failed to load categories: ${e.message}');
    }
  }
}