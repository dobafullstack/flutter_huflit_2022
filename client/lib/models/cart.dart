import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nda_18dh110793/models/product.dart';

class Cart {
  List<Map<String, dynamic>> cart = [];
  StreamController cartController =
      StreamController<List<Map<String, dynamic>>>.broadcast();
  Stream get cartStream => cartController.stream;

  void addProductToCart(Product product, int amount) {
    int existingProduct = findIndex(product);

    if (existingProduct >= 0) {
      cart[existingProduct]["amount"] += amount;
    } else {
      Map<String, dynamic> data = {"product": product, "amount": amount};

      cart.add(data);
    }

    cartController.sink.add(cart);
  }

  void removeFromCart(Product product) {
    cart =
        cart.where((element) => element["product"].id != product.id).toList();

    cartController.sink.add(cart);
  }

  int findIndex(Product product) {
    int existingProduct =
        cart.indexWhere((element) => element["product"].id == product.id);

    return existingProduct;
  }

  void dispose() {
    cartController.close();
  }
}

Cart cart = Cart();
