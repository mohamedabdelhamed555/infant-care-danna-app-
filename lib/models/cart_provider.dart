import 'package:flutter/material.dart';
import 'package:graduation/models/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<ProductCardModelTest> _cartItems = [];

  List<ProductCardModelTest> get cartItems => _cartItems;

  void addToCart(ProductCardModelTest product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(ProductCardModelTest product) {
    _cartItems.remove(product);
    notifyListeners();
  }
}
