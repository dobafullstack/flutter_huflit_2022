import 'package:flutter/material.dart';
import 'package:nda_18dh110793/screens/login.dart';

import '../constants/colors.dart';
import '../helpers/custom_share_reference.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    CustomShareReference.init();
    _navigateToHome();
    
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.PRIMARY_COLOR,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: Colors.blue,
              backgroundColor: Colors.white,
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Text(
              "Loading...",
              style: TextStyle(color: Colors.white, fontSize: 24),
            )
          ],
        ),
      ),
    );
  }
}
