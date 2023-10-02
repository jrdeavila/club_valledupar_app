import 'package:club_valledupar_app/lib.dart';

class Order {
  final String id;
  final String status;
  final String address;
  final Partner partner;
  final List<OrderDetail> details;

  Order({
    required this.id,
    required this.status,
    required this.address,
    required this.partner,
    required this.details,
  });
}

class OrderDetail {
  final String id;
  final MenuProduct product;
  final int quantity;

  OrderDetail({
    required this.id,
    required this.product,
    required this.quantity,
  });

  double get total => product.price * quantity;
}
