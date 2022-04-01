import 'package:flutter/material.dart';
import 'package:nda_18dh110793/models/product.dart';

import '../constants/colors.dart';

class ProductDetailPage extends StatelessWidget {
  Product product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Image(image: AssetImage(product.image)),
              Padding(padding: EdgeInsets.symmetric(vertical: 16)),
              Text(product.description)
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {}, child: Text("Add to cart"))),
          )
        ],
      ),
    );
  }

  AppBar Navbar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: MyColors.PRIMARY_COLOR,
      title: Text("Details"),
    );
  }
}
