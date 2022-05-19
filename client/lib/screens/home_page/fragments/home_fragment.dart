import 'package:flutter/material.dart';
import 'package:nda_18dh110793/models/product.dart';
import 'package:nda_18dh110793/screens/home_page/components/category_store.dart';
import 'package:nda_18dh110793/screens/home_page/components/product_item.dart';
import 'package:nda_18dh110793/screens/home_page/components/product_popular.dart';

import '../../../constants/colors.dart';
import '../components/home_header.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  bool searchingMode = false;
  String searchValue = "";

  @override
  Widget build(BuildContext context) {
    final List<Widget> categoryAndProduct = [
      SeeMore("Categories"),
      CategoryStore(),
      SeeMore("Popular Products"),
      ProductPopular(),
    ];

    final searchItems = Product.init()
        .where((element) =>
            element.title.toLowerCase().contains(searchValue.toLowerCase()))
        .toList();

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 44),
          sliver: SliverToBoxAdapter(
            child: HomeHeader(
              onSearch: (value) {
                if (value.isEmpty) {
                  setState(() {
                    searchingMode = false;
                    searchValue = "";
                  });
                } else {
                  setState(() {
                    searchingMode = true;
                    searchValue = value;
                  });
                }
              },
            ),
          ),
        ),
        if (!searchingMode)
          ...categoryAndProduct
        else
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              childAspectRatio: 0.65,
              crossAxisSpacing: 10,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => ProductItem(product: searchItems[index]),
              childCount: searchItems.length,
            ),
          )
      ],
    );
  }

  Widget SeeMore(String title) {
    return SliverPadding(
      padding: EdgeInsets.all(16),
      sliver: SliverToBoxAdapter(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                color: MyColors.PRIMARY_COLOR, fontWeight: FontWeight.bold),
          ),
          Text(
            "See more",
            style: TextStyle(color: MyColors.PRIMARY_COLOR),
          ),
        ],
      )),
    );
  }
}
