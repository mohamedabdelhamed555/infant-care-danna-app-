import 'package:flutter/material.dart';
import 'package:graduation/models/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:graduation/screens/proooduct/product_details_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xff32AA90),
        title: const Text(
          "Shopping Cart",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: cartProvider.cartItems.isEmpty
          ? const Center(child: Text("Your cart is empty."))
          : ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final product = cartProvider.cartItems[index];
                return ListTile(
                  contentPadding: const EdgeInsets.all(8.0),
                  leading: Image.network(
                    product.imagePath,
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.12,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.productName,
                      style: const TextStyle(fontSize: 16.0)),
                  subtitle: Text('\$${product.finalPrice}',
                      style:
                          const TextStyle(fontSize: 14.0, color: Colors.grey)),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      cartProvider.removeFromCart(product);
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(product: product),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
