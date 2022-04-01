import 'package:flutter/material.dart';

import '../../../models/product.dart';

class CartItem extends StatelessWidget {
  Product product;

  CartItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      height: 120,
      decoration: BoxDecoration(color: Colors.grey[200]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image(image: AssetImage(product.image)),
              Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
              Text(product.title)
            ],
          ),
          Text(product.price.toString()),
          Icon(Icons.delete)
        ],
      ),
    );
  }
}
