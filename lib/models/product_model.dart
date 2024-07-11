class ProductCardModelTest {
  final String imagePath;
  final String description;
  final String label;
  final int? quantity;
  final int? sold;
  final double? finalPrice;
  final int? discount;
  final String? brand;
  final String productName;
  final double originalPrice;
  final double discountedPrice;
  bool isFavorite;
  List<String> postImages;

  ProductCardModelTest({
    this.finalPrice,
    this.brand,
    this.quantity,
    this.postImages = const [],
    this.sold,
    this.discount,
    required this.description,
    required this.imagePath,
    required this.label,
    required this.productName,
    required this.originalPrice,
    this.discountedPrice = 0.0,
    this.isFavorite = false,
  });
}
