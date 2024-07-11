import 'package:flutter/material.dart';
import 'package:graduation/models/product_model.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<ProductCardModelTest> _favoriteProducts = [];

  List<ProductCardModelTest> get favoriteProducts => _favoriteProducts;

  void addProductToFavorites(ProductCardModelTest product) {
    if (!_favoriteProducts.contains(product)) {
      _favoriteProducts.add(product);
      notifyListeners();
    }
  }

  void removeProductFromFavorites(ProductCardModelTest product) {
    if (_favoriteProducts.contains(product)) {
      _favoriteProducts.remove(product);
      notifyListeners();
    }
  }

  bool isProductFavorite(ProductCardModelTest product) {
    return _favoriteProducts.contains(product);
  }
}
