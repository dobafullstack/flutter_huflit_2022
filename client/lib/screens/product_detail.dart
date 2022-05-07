import 'package:flutter/material.dart';
import 'package:nda_18dh110793/models/favourite.dart';
import 'package:nda_18dh110793/models/product.dart';

import '../constants/colors.dart';
import '../models/cart.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage();

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int amount = 1;

  onChangeAmount(int amount) {
    if (this.amount != 1 || amount > 0) {
      setState(() {
        this.amount += amount;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: Navbar(context, product),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Image(image: AssetImage(product.image)),
              Padding(padding: EdgeInsets.symmetric(vertical: 16)),
              Text(product.description),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                      color: MyColors.PRIMARY_COLOR,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    product.price.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
            child: Row(
              children: [
                Row(
                  children: [
                    _buildIncreaseDecrease(increase: false),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(amount.toString())),
                    _buildIncreaseDecrease(),
                  ],
                ),
                Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: ElevatedButton(
                          onPressed: () {
                            if (cart.findIndex(product) >= 0) {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) =>
                                    Popup(context),
                              );
                            } else {
                              cart.addProductToCart(product, amount);
                            }
                          },
                          child: Text("Add to cart"))),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  AlertDialog Popup(BuildContext context) {
    return AlertDialog(
      title: const Text('Add to cart'),
      content: const Text('Existing product in cart'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }

  Widget _buildIncreaseDecrease({bool increase = true}) {
    return GestureDetector(
      onTap: () {
        increase ? onChangeAmount(1) : onChangeAmount(-1);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
            color: MyColors.PRIMARY_COLOR,
            borderRadius: BorderRadius.circular(8)),
        child: Text(
          increase ? "+" : "-",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  AppBar Navbar(BuildContext context, Product product) {
    return AppBar(
      elevation: 0,
      backgroundColor: MyColors.PRIMARY_COLOR,
      title: Text(product.title),
      actions: [
        GestureDetector(
            onTap: () {
              favorite.addToFavorite(product);
              setState(() {});
            },
            child: Icon(
              Icons.favorite,
              color:
                  favorite.checkInFavorite(product) ? Colors.red : Colors.white,
            )),
        Padding(padding: EdgeInsets.only(right: 16))
      ],
    );
  }
}
