import 'package:flutter/material.dart';

class NotificationFragment extends StatefulWidget {
  NotificationFragment({Key? key}) : super(key: key);

  @override
  State<NotificationFragment> createState() => _NotificationFragmentState();
}

class _NotificationFragmentState extends State<NotificationFragment> {
  @override
  Widget build(BuildContext context) {
    return Text("Notification");
  }
}