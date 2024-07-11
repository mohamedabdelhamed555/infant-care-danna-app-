import 'package:flutter/material.dart';
import 'package:graduation/models/product_model.dart';
import 'package:graduation/widget/product/product_in_cart.dart';

// ignore: camel_case_types
class cartListView extends StatelessWidget {
  cartListView({
    super.key,
    required this.itemCount,
  });

  final int itemCount;
  final List<ProductCardModelTest> productsCart = [
    ProductCardModelTest(
        quantity: 0,
        sold: 0,
        brand: '',
        description: "",
        imagePath: "assets/images/bear.png",
        label: "SPECIAL",
        productName: "Soft Rabbit Tot",
        originalPrice: 45.5,
        discountedPrice: 360),
    ProductCardModelTest(
        quantity: 0,
        sold: 0,
        brand: '',
        description: "",
        imagePath: "assets/images/chair.png",
        label: "SPECIAL",
        productName: "Soft Rabbit Tot",
        originalPrice: 45.5,
        discountedPrice: 310),
    ProductCardModelTest(
        quantity: 0,
        sold: 0,
        brand: '',
        description: "",
        imagePath: "assets/images/bear.png",
        label: "SPECIAL",
        productName: "Soft Rabbit Tot",
        originalPrice: 45.5,
        discountedPrice: 30),
    ProductCardModelTest(
        quantity: 0,
        sold: 0,
        brand: '',
        description: "",
        imagePath: "assets/images/bear.png",
        label: "SPECIAL",
        productName: "Soft Rabbit Tot",
        originalPrice: 45.5,
        discountedPrice: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: productsCart.length,
        itemBuilder: (context, index) {
          return ProductInCart(
            initialItemCount: itemCount,
            productCar: productsCart[index],
          );
        });
  }
}
