import 'package:flutter/material.dart';
import 'package:graduation/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.width * 0.3,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(category.image))),
        ),
        Text(
          category.categoryName,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
