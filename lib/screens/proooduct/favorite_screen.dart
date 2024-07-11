import 'package:flutter/material.dart';
import 'package:graduation/models/fav_provider.dart';
import 'package:provider/provider.dart';
import 'product_details_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff32AA90),
        title: const Text(
          "Favorites",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: favoriteProvider.favoriteProducts.isEmpty
          ? const Center(
              child: Text("No favorite products yet."),
            )
          : ListView.builder(
              itemCount: favoriteProvider.favoriteProducts.length,
              itemBuilder: (context, index) {
                final product = favoriteProvider.favoriteProducts[index];
                return ListTile(
                  contentPadding: const EdgeInsets.all(8.0),
                  leading: Image.network(
                    product.imagePath,
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.12,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.label,
                      style: const TextStyle(fontSize: 16.0)),
                  subtitle: Text('\$${product.finalPrice}',
                      style:
                          const TextStyle(fontSize: 14.0, color: Colors.grey)),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle, color: Colors.red),
                    onPressed: () {
                      favoriteProvider.removeProductFromFavorites(product);
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
