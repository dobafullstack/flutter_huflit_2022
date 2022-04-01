import 'package:flutter/material.dart';
import 'package:nda_18dh110793/constants/colors.dart';

import 'screens/home_page/home.dart';
import 'screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MyColors.MATERIAL_PRIMARY_COLOR,
      ),
      home: SplashPage(),
    );
  }
}
