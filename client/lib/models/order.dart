import 'package:nda_18dh110793/helpers/getRandomString.dart';

class Order {
  late String id;
  String image;
  DateTime createdAt;
  String status;
  double total;
  int quantity;

  Order({
    required this.image,
    required this.createdAt,
    required this.status,
    required this.total,
    required this.quantity,
  }) {
    id = getRandomString(4);
  }
}
