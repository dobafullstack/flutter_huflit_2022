import 'package:flutter/material.dart';
import 'package:nda_18dh110793/helpers/cart.dart';

import '../../../models/product.dart';

class CartItem extends StatelessWidget {
  Product product;
  int amount;

  CartItem({required this.product, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      height: 120,
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
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
          Text("x${amount.toString()}"),
          Text("${product.price}"),
          GestureDetector(
              onTap: () {
                cartStream.removeFromCart(product);
              },
              child: Icon(Icons.delete))
        ],
      ),
    );
  }
}
