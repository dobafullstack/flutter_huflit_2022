import 'package:flutter/material.dart';
import 'package:nda_18dh110793/models/cart.dart';
import 'package:nda_18dh110793/screens/cart_page/components/cart_item.dart';

import '../../constants/colors.dart';
import '../../models/product.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          initialData: cart.cart,
          stream: cart.cartStream,
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              var data = snapShot.data as List<Map<String, dynamic>>;

              return CustomScrollView(
                slivers: [
                  Navbar(context),
                  data.isEmpty
                      ? SliverFillRemaining(
                          child: Center(
                              child: Text(
                            "Cart is null",
                            style: TextStyle(fontSize: 20),
                          )),
                        )
                      : SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: CartItem(
                                product: data[index]["product"],
                                amount: data[index]["amount"],
                              ),
                            );
                          },
                              childCount:
                                  (snapShot.data as List<Map<String, dynamic>>)
                                      .length),
                        ),
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }

  SliverAppBar Navbar(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      backgroundColor: MyColors.PRIMARY_COLOR,
      title: Text("Cart Details"),
    );
  }
}
