import 'package:nda_18dh110793/models/product.dart';

class Cart {
  static List<Product> cart = [];

  void addProductToCart(Product product) {
    cart.add(product);
  }

  List<Product> getCart() {
    return cart;
  }

  static List<Product> init() {
    List<Product> cart = [];
    List<Product> products = Product.init();

    products.sublist(0, 2).forEach((element) {
      cart.add(element);
    });

    return cart;
  }
}
