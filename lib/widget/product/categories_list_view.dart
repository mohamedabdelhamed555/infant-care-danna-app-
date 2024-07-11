// import 'package:flutter/material.dart';
// import 'package:graduation/models/category_model.dart';
// import 'package:graduation/widget/product/category_card.dart';

// class CategoriesListView extends StatelessWidget {
//   const CategoriesListView({
//     super.key,
//   });
//   final List<CategoryModel> categories = const [
//     CategoryModel(categoryName: "Bottels", image: "assets/images/bottels.png"),
//     CategoryModel(categoryName: "Cribs", image: "assets/images/cribs.png"),
//     CategoryModel(categoryName: "Others", image: "assets/images/other.png"),
//     CategoryModel(categoryName: "Others", image: "assets/images/toys.png"),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.width * 0.44,
//       child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: categories.length,
//           itemBuilder: (context, index) {
//             return GestureDetector(
//               onTap: () {},
//               child: CategoryCard(
//                 category: categories[index],
//               ),
//             );
//           }),
//     );
//   }
// }
