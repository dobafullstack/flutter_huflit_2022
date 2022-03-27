import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';
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

  int _selectedTab = 0;

  void _onSelectTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            width: double.infinity,
            child: Column(
              children: [HomeHeader(), fragments[_selectedTab]],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Account',
            ),
          ],
          currentIndex: _selectedTab,
          onTap: _onSelectTab,
          selectedItemColor: Colors.blue,
        ),
      ),
    );
  }
}
