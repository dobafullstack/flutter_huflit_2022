import 'package:flutter/material.dart';

import '../../../widgets/Input.dart';

class HomeHeader extends StatefulWidget {
  HomeHeader({Key? key}) : super(key: key);

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Input(
            hintText: "Search product",
            prefixIcon: Icons.search,
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
        Container(
          padding: EdgeInsets.all(16),
          child: Icon(Icons.shopping_cart_outlined),
          color: Color.fromARGB(33, 158, 158, 158),
        )
      ],
    );
  }
}
