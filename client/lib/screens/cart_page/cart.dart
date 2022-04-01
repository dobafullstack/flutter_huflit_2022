import 'package:flutter/material.dart';
import 'package:nda_18dh110793/models/cart.dart';
import 'package:nda_18dh110793/screens/cart_page/components/cart_item.dart';

import '../../constants/colors.dart';
import '../../models/product.dart';

class CartPage extends StatefulWidget {
  final List<Product> cart = Cart.init();

  CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: Navbar(context),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    CartItem(product: widget.cart[index]),
                separatorBuilder: (context, index) => Divider(),
                itemCount: widget.cart.length),
            
          ],
        ),
      ),
    );
  }

  AppBar Navbar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: MyColors.PRIMARY_COLOR,
      title: Text("Cart Details"),
    );
  }
}
