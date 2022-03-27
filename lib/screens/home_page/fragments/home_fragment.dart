import 'package:flutter/material.dart';
import 'package:nda_18dh110793/screens/home_page/components/category_store.dart';
import 'package:nda_18dh110793/screens/home_page/components/product_popular.dart';

class HomeFragment extends StatefulWidget {
  HomeFragment({Key? key}) : super(key: key);

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [CategoryStore(), ProductPopular()],
    );
  }
}
