import 'package:flutter/material.dart';

class BottomNavigation {
  String label;
  IconData icon;

  BottomNavigation({required this.label, required this.icon});

  static List<BottomNavigation> init() {
    return [
      BottomNavigation(label: "Home", icon: Icons.home),
      BottomNavigation(
        icon: Icons.favorite,
        label: 'Favorite',
      ),
      BottomNavigation(
        icon: Icons.notifications,
        label: 'Notification',
      ),
      BottomNavigation(
        icon: Icons.account_circle,
        label: 'Account',
      ),
    ];
  }
}
