import 'package:flutter/material.dart';
import 'package:nda_18dh110793/models/product.dart';
import 'package:nda_18dh110793/screens/home_page/components/product_item.dart';

import '../../../constants/colors.dart';

class ProductPopular extends StatefulWidget {
  ProductPopular({Key? key}) : super(key: key);

  @override
  State<ProductPopular> createState() => _ProductPopularState();
}

class _ProductPopularState extends State<ProductPopular> {
  final products = Product.init();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Popular Products",
              style: TextStyle(
                  color: MyColors.PRIMARY_COLOR, fontWeight: FontWeight.bold),
            ),
            Text(
              "See more",
              style: TextStyle(color: MyColors.PRIMARY_COLOR),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 16)),
        GridView.builder(
          // physics: ScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            childAspectRatio: 0.65,
            crossAxisSpacing: 10
          ),
          itemBuilder: (context, index) =>
              ProductItem(product: products[index]),
          itemCount: products.length,
        )
      ],
    );
  }
}
