import 'dart:async';

import 'package:nda_18dh110793/models/product.dart';

import '../models/cart.dart';

class CartStream {
  Cart cart = Cart(total: 0, cart: []);
  StreamController cartController = StreamController<Cart>.broadcast();
  Stream get cartStream => cartController.stream;

  void addProductToCart(Product product, int amount) {
    int existingProduct = findIndex(product);

    if (existingProduct >= 0) {
      //existing in cart
      cart.cart[existingProduct]["amount"] += amount;
    } else {
      //not in cart
      Map<String, dynamic> data = {"product": product, "amount": amount};

      cart.cart.add(data);
    }
    cart.total += product.price * amount;
    cartController.sink.add(cart);
  }

  void removeFromCart(Product product) {
    int existingIndex = findIndex(product);

    cart.total -= cart.cart[existingIndex]["product"].price *
        cart.cart[existingIndex]["amount"];

    cart.cart = cart.cart
        .where((element) => element["product"].id != product.id)
        .toList();

    cartController.sink.add(cart);
  }

  int findIndex(Product product) {
    int existingProduct =
        cart.cart.indexWhere((element) => element["product"].id == product.id);

    return existingProduct;
  }

  removeAll() {
    cart = Cart(cart: [], total: 0);

    cartController.sink.add(cart);
  }

  void dispose() {
    cartController.close();
  }
}

CartStream cartStream = CartStream();
