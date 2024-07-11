import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduation/models/fav_provider.dart';
import 'package:graduation/models/product_model.dart';
import 'package:graduation/screens/proooduct/cart_screen.dart';
import 'package:graduation/screens/proooduct/favorite_screen.dart';
import 'package:graduation/screens/proooduct/product_details_screen.dart';
import 'package:graduation/services/product_services.dart';
import 'package:graduation/widget/drawer.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  final ProductCardModelTest? product;

  const ProductScreen({super.key, this.product});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<ProductCardModelTest> products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    ProductServices productServices = ProductServices(Dio());
    List<ProductCardModelTest> fetchProducts =
        await productServices.getProducts();
    setState(() {
      products = fetchProducts;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const CartScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoriteScreen()),
              );
            },
          ),
        ],
        backgroundColor: const Color(0xff32AA90),
        title: const Text(
          "Product Screen",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      drawer: const AllDrawer(),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.3 / 3,
                mainAxisSpacing: 9,
              ),
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                final product = products[index];
                final isFavorite = favoriteProvider.isProductFavorite(product);

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          product: product,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    surfaceTintColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Image.network(
                              product.imagePath,
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.12,
                            ),
                          ),
                          Text(
                            product.productName,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 16),
                          ),
                          Text(
                            product.label,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 18),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    if (product.discount != null &&
                                        product.discount! > 0)
                                      Text(
                                        '%${product.discount}',
                                        style: const TextStyle(
                                            color: Colors.red, fontSize: 16),
                                      ),
                                    const SizedBox(width: 3),
                                    Expanded(
                                      child: Text(
                                        '${product.originalPrice}',
                                        maxLines: 1,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (product.discount == null ||
                                  product.discount! <= 0)
                                Expanded(child: Container()),
                              const SizedBox(width: 5),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (isFavorite) {
                                      favoriteProvider
                                          .removeProductFromFavorites(product);
                                    } else {
                                      favoriteProvider
                                          .addProductToFavorites(product);
                                    }
                                  });
                                },
                                icon: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isFavorite
                                      ? Colors.pinkAccent
                                      : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
