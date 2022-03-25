import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialIcon extends StatelessWidget {
  String asset;
  SocialIcon({required this.asset});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: new SvgPicture.asset(asset),
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Color.fromARGB(36, 219, 219, 219)),
    );
  }
}
