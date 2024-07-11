import 'package:dio/dio.dart';
import 'package:graduation/models/product_model.dart';

class ProductServices {
  final Dio dio;
  ProductServices(this.dio);

  Future<List<ProductCardModelTest>> getProducts() async {
    var response = await dio.get('http://danna-pi.vercel.app/api/v1/products');
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> products = jsonData['result'];

    List<ProductCardModelTest> productsList = [];
    for (var product in products) {
      List<String> images = [];
      for (var image in product['images']) {
        images.add(image['url']);
      }

      ProductCardModelTest productModel = ProductCardModelTest(
        postImages: images,
        finalPrice: product['finalPrice'],
        discount: product['discount'],
        sold: product['sold'],
        quantity: product['quantity'],
        brand: product['brand']['name'],
        description: product['description'],
        imagePath: product['imageCover']['url'],
        label: product['title'],
        productName: product['category']['name'],
        originalPrice: product['price'],
      );
      productsList.add(productModel);
    }
    return productsList;
  }
}
