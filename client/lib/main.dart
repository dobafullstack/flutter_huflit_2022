import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nda_18dh110793/constants/colors.dart';
import 'package:nda_18dh110793/routes.dart';

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
      routes: routes,
      initialRoute: "/",
      theme: ThemeData(
          primarySwatch: MyColors.MATERIAL_PRIMARY_COLOR,
          appBarTheme:
              AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light)),
      home: SplashPage(),
    );
  }
}
