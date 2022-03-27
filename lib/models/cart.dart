import 'package:nda_18dh110793/models/product.dart';

class Cart {
  static List<Product> cart = [];
  void addProductToCart(Product product){
    cart.add(product);
  }

  List<Product> getCart(){
    return cart;
  }
}
