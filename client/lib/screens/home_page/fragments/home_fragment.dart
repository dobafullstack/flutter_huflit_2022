import 'package:flutter/material.dart';
import 'package:nda_18dh110793/screens/home_page/components/category_store.dart';
import 'package:nda_18dh110793/screens/home_page/components/product_popular.dart';

import '../../../constants/colors.dart';
import '../components/home_header.dart';

class HomeFragment extends StatefulWidget {
  HomeFragment({Key? key}) : super(key: key);

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 44),
          sliver: SliverToBoxAdapter(
            child: HomeHeader(),
          ),
        ),
        SeeMore("Categories"),
        CategoryStore(),
        SeeMore("Popular Products"),
        ProductPopular()
      ],
    );
  }

  SliverPadding SeeMore(String title) {
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
