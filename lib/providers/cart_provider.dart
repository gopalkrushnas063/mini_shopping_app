import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/cart_item.dart';

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addToCart(CartItem newItem) {
    final index = state.indexWhere((item) => item.product.id == newItem.product.id);
    
    if (index >= 0) {
      state = [
        ...state.sublist(0, index),
        CartItem(
          product: newItem.product,
          quantity: state[index].quantity + newItem.quantity,
        ),
        ...state.sublist(index + 1),
      ];
    } else {
      state = [...state, newItem];
    }
  }

  void removeFromCart(int productId) {
    state = state.where((item) => item.product.id != productId).toList();
  }

  void updateQuantity(int productId, int newQuantity) {
    final index = state.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      state = [
        ...state.sublist(0, index),
        CartItem(
          product: state[index].product,
          quantity: newQuantity,
        ),
        ...state.sublist(index + 1),
      ];
    }
  }

  void clearCart() {
    state = [];
  }

  double get totalPrice {
    return state.fold(0, (sum, item) => sum + item.totalPrice);
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});