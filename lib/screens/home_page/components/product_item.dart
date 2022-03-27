import 'package:flutter/material.dart';

import '../../../models/product.dart';

class ProductItem extends StatelessWidget {
  Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 16),
          width: double.infinity,
          child: Image(
            image: AssetImage(
              product.image,
            ),
            fit: BoxFit.fill,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Expanded(child: Text(product.title)),
            Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.green),
                child: Text(
                  product.price.toString() + "\$",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
          ],
        ),
        Positioned(
          child: Text(product.title),
          bottom: 0,
        )
      ],
    );
  }
}
