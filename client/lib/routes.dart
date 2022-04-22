import 'package:flutter/material.dart';
import 'package:nda_18dh110793/screens/cart_page/cart.dart';
import 'package:nda_18dh110793/screens/category/category_page.dart';
import 'package:nda_18dh110793/screens/home_page/home.dart';
import 'package:nda_18dh110793/screens/login.dart';
import 'package:nda_18dh110793/screens/product_detail.dart';
import 'package:nda_18dh110793/screens/signup.dart';
import 'package:nda_18dh110793/screens/splash.dart';

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  "": (context) => SplashPage(),
  "/login": (context) => LoginPage(),
  "/signUp": (context) => SignUpPage(),
  "/category-detail": (context) => CategoryPage(),
  "/product-detail": (context) => ProductDetailPage(),
  "/cart": (context) => CartPage(),
  "/home": (context) => HomePage()
};
