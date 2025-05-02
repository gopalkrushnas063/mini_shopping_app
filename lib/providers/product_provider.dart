import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_shopping_app/data/http_service.dart';
import '../data/product_repository.dart';
import '../models/product.dart';

final productRepositoryProvider = Provider((ref) {
  return ProductRepository(HttpService.dio);
});

final productsProvider = FutureProvider<List<Product>>((ref) async {
  final repository = ref.read(productRepositoryProvider);
  return await repository.getProducts();
});

final categoriesProvider = FutureProvider<List<String>>((ref) async {
  final products = await ref.watch(productsProvider.future);
  return products.map((p) => p.category).toSet().toList();
});

final selectedCategoryProvider = StateProvider<String?>((ref) => null);
final searchQueryProvider = StateProvider<String>((ref) => '');

final filteredProductsProvider = FutureProvider<List<Product>>((ref) async {
  final selectedCategory = ref.watch(selectedCategoryProvider);
  final searchQuery = ref.watch(searchQueryProvider);
  final products = await ref.watch(productsProvider.future);

  var filteredProducts = products;
  
  // Filter by category if selected
  if (selectedCategory != null) {
    filteredProducts = filteredProducts.where((p) => p.category == selectedCategory).toList();
  }
  
  // Filter by search query if not empty
  if (searchQuery.isNotEmpty) {
    filteredProducts = filteredProducts.where((p) => 
      p.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
      p.description.toLowerCase().contains(searchQuery.toLowerCase()) ||
      p.category.toLowerCase().contains(searchQuery.toLowerCase())
    ).toList();
  }
  
  return filteredProducts;
});