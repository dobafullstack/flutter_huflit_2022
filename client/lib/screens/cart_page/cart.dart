import 'package:flutter/material.dart';
import 'package:nda_18dh110793/helpers/cart.dart';
import 'package:nda_18dh110793/helpers/order.dart';
import 'package:nda_18dh110793/screens/cart_page/components/cart_item.dart';

import '../../constants/colors.dart';
import '../../models/cart.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: cartStream.cart,
        stream: cartStream.cartStream,
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            var data = snapShot.data as Cart;
            return Scaffold(
                persistentFooterButtons: [_buildCheckout(total: data.total)],
                body: CustomScrollView(
                  slivers: [
                    Navbar(context),
                    data.cart.isEmpty
                        ? SliverFillRemaining(
                            child: Center(
                                child: Text(
                              "Cart is null",
                              style: TextStyle(fontSize: 20),
                            )),
                          )
                        : SliverList(
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: CartItem(
                                  product: data.cart[index]["product"],
                                  amount: data.cart[index]["amount"],
                                ),
                              );
                            }, childCount: (data.cart).length),
                          ),
                  ],
                ));
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  Row _buildCheckout({required double total}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Text(
                "Total: $total\$",
              ),
            ),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              if (cartStream.cart.cart.isEmpty) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Warning"),
                    content: Text("Cart is null"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              } else {
                orderStream.checkout(cartStream.cart);
                cartStream.removeAll();
              }
            },
            child: Text("Checkout"),
          ),
        )
      ],
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
