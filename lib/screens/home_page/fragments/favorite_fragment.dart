import 'package:flutter/material.dart';

class FavoriteFragment extends StatefulWidget {
  FavoriteFragment({Key? key}) : super(key: key);

  @override
  State<FavoriteFragment> createState() => _FavoriteFragmentState();
}

class _FavoriteFragmentState extends State<FavoriteFragment> {
  @override
  Widget build(BuildContext context) {
    return Text("Favorite");
  }
}