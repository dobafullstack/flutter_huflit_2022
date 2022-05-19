import 'package:flutter/material.dart';
import 'package:nda_18dh110793/helpers/order.dart';
import 'package:nda_18dh110793/screens/home_page/components/order_item.dart';

import '../../../constants/colors.dart';
import '../../../models/order.dart';

class NotificationFragment extends StatefulWidget {
  const NotificationFragment({Key? key}) : super(key: key);

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
        StreamBuilder(
          initialData: orderStream.orders,
          builder: (context, snapShot) {
            final orders = snapShot.data as List<Order>;
            if (!snapShot.hasData || orders.isEmpty) {
              return SliverFillRemaining(
                child: Center(
                  child: Text(
                    "Notification is null",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              );
            } else {
              return SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => OrderItem(order: orders[index]),
                    childCount: orders.length,
                  ),
                ),
              );
            }
          },
        )
      ],
    );
  }
}
