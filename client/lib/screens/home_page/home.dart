import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:nda_18dh110793/constants/colors.dart';
import 'package:nda_18dh110793/models/bottom_navigation.dart';
import 'package:nda_18dh110793/screens/home_page/components/home_header.dart';
import 'package:nda_18dh110793/screens/home_page/fragments/account_fragment.dart';
import 'package:nda_18dh110793/screens/home_page/fragments/favorite_fragment.dart';
import 'package:nda_18dh110793/screens/home_page/fragments/home_fragment.dart';
import 'package:nda_18dh110793/screens/home_page/fragments/notification_fragment.dart';

import '../../widgets/Input.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> fragments = [
    HomeFragment(),
    FavoriteFragment(),
    NotificationFragment(),
    AccountFragment()
  ];
  final bottomNavigationList = BottomNavigation.init();

  int _selectedTab = 0;

  void _onSelectTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: fragments[_selectedTab],
      bottomNavigationBar: BottomNavBar(),
    );
  }

  BottomNavigationBar BottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      // ignore: prefer_const_literals_to_create_immutables
      items: bottomNavigationList
          .map((item) =>
              BottomNavigationBarItem(icon: Icon(item.icon), label: item.label))
          .toList(),
      currentIndex: _selectedTab,
      onTap: _onSelectTab,
      selectedItemColor: Colors.blue,
    );
  }

  AppBar Navbar(BuildContext context, String title) {
    return AppBar(
      elevation: 0,
      backgroundColor: MyColors.PRIMARY_COLOR,
      title: Text(title),
    );
  }
}
