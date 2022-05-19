import 'dart:async';

import '../models/cart.dart';
import '../models/order.dart';

class OrderController {
  List<Order> orders = [];
  StreamController orderController = StreamController<List<Order>>.broadcast();
  Stream get orderStream => orderController.stream;

  checkout(Cart cart) {
    var newOrder = Order(
      createdAt: DateTime.now(),
      image: cart.cart[0]["product"].image,
      status: "pending",
      total: cart.total,
      quantity: cart.cart.length,
    );

    orders.add(newOrder);

    orderController.sink.add(orders);
  }
}

final orderStream = OrderController();
