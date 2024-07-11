import 'package:flutter/material.dart';
import 'package:graduation/models/product_model.dart';

class ProductInCart extends StatefulWidget {
  const ProductInCart({
    Key? key,
    required this.initialItemCount,
    required this.productCar,
  }) : super(key: key);

  final int initialItemCount;
  final ProductCardModelTest productCar;

  @override
  State<ProductInCart> createState() => _ProductInCartState();
}

class _ProductInCartState extends State<ProductInCart> {
  late int itemCount;

  @override
  void initState() {
    super.initState();
    itemCount = widget.initialItemCount;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.width * 0.29,
      child: Row(
        children: [
          Image.asset(
            widget.productCar.imagePath,
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.width * 0.24,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.productCar.productName,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                ),
                Row(
                  children: [
                    Text("$itemCount",
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey)),
                    Text("*\$${widget.productCar.originalPrice}",
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          itemCount++;
                        });
                      },
                    ),
                    Text("$itemCount", style: const TextStyle(fontSize: 18)),
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (itemCount > 1) itemCount--;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
