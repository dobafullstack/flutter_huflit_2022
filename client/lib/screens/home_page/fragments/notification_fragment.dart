import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class NotificationFragment extends StatefulWidget {
  NotificationFragment({Key? key}) : super(key: key);

  @override
  State<NotificationFragment> createState() => _NotificationFragmentState();
}

class _NotificationFragmentState extends State<NotificationFragment> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          elevation: 0,
          backgroundColor: MyColors.PRIMARY_COLOR,
          title: Text("Notification"),
          leading: Container(),
        ),
        SliverToBoxAdapter(
          child: Text("Notification"),
        )
      ],
    );
  }
}
