import 'package:flutter/material.dart';

import '../../../widgets/Input.dart';

class HomeHeader extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  Function(String) onSearch;

  HomeHeader({required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Input(
            // controller: _controller,
            hintText: "Search product",
            prefixIcon: Icons.search,
            onChange: onSearch,
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/cart");
          },
          child: Container(
            padding: EdgeInsets.all(16),
            child: Icon(Icons.shopping_cart_outlined),
            color: Color.fromARGB(33, 158, 158, 158),
          ),
        )
      ],
    );
  }
}
