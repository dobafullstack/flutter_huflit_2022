import 'package:flutter/material.dart';
import 'package:nda_18dh110793/constants/colors.dart';
import 'package:nda_18dh110793/models/category.dart';
import 'package:nda_18dh110793/screens/home_page/components/category_item.dart';

class CategoryStore extends StatefulWidget {
  CategoryStore({Key? key}) : super(key: key);

  @override
  State<CategoryStore> createState() => _CategoryStoreState();
}

class _CategoryStoreState extends State<CategoryStore> {
  final categories = Category.init();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: TextStyle(
                    color: MyColors.PRIMARY_COLOR, fontWeight: FontWeight.bold),
              ),
              Text(
                "See more",
                style: TextStyle(color: MyColors.PRIMARY_COLOR),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 16)),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoryItem(category: categories[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
