import 'package:flutter/material.dart';
import 'package:nda_18dh110793/models/product.dart';

import '../constants/colors.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage();

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: Navbar(context, product.title),
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
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
            child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {}, child: Text("Add to cart"))),
          )
        ],
      ),
    );
  }

  AppBar Navbar(BuildContext context, String title) {
    return AppBar(
      elevation: 0,
      backgroundColor: MyColors.PRIMARY_COLOR,
      title: Text(title),
    );
  }
}
