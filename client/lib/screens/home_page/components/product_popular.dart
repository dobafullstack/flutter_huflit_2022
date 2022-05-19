import 'package:flutter/material.dart';
import 'package:nda_18dh110793/models/product.dart';
import 'package:nda_18dh110793/screens/home_page/components/product_item.dart';

import '../../../constants/colors.dart';

class ProductPopular extends StatefulWidget {
  const ProductPopular({Key? key}) : super(key: key);

  @override
  State<ProductPopular> createState() => _ProductPopularState();
}

class _ProductPopularState extends State<ProductPopular> {
  final products = Product.init();

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          childAspectRatio: 0.65,
          crossAxisSpacing: 10,
        ),
        delegate: SliverChildBuilderDelegate(
            (context, index) => ProductItem(product: products[index]),
            childCount: products.length),
      ),
    );
  }
}
