import 'package:flutter/material.dart';

import '../../../models/category.dart';

class CategoryItem extends StatelessWidget {
  Category category;

  CategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      padding: EdgeInsets.all(5),
      child: Image(image: AssetImage(category.image)),
    );
  }
}
