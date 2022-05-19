import 'package:flutter/material.dart';
import 'package:nda_18dh110793/constants/colors.dart';

import '../../../models/order.dart';

class OrderItem extends StatelessWidget {
  Order order;

  OrderItem({
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    final String createdAt =
        "${order.createdAt.year.toString()}-${order.createdAt.month.toString().padLeft(2, '0')}-${order.createdAt.day.toString().padLeft(2, '0')}";

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: MyColors.PRIMARY_COLOR,
        ),
      ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "#${order.id}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    createdAt,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Image.asset(order.image),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.grey),
                  text: "Quantity: ",
                  children: [
                    TextSpan(
                      text: "${order.quantity}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.yellow[600],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(order.status),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.grey),
                text: "Total: ",
                children: [
                  TextSpan(
                    text: "\$${order.total}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
