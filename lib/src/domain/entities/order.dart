import 'package:club_valledupar_app/lib.dart';

class Order {
  final String id;
  final String status;
  final String? address;
  final Partner partner;
  final List<OrderDetail> details;
  final bool isDomicile;
  final String? createdAt;

  Order({
    required this.id,
    required this.status,
    required this.address,
    required this.partner,
    required this.details,
    required this.isDomicile,
    this.createdAt,
  });

  double get total => details.fold(0, (total, detail) => total + detail.total);
}

class OrderDetail {
  final String id;
  final MenuProduct product;
  int quantity;

  OrderDetail({
    required this.id,
    required this.product,
    required this.quantity,
  });

  double get total => product.price * quantity;

  void addOrderDetail(OrderDetail orderDetail) {
    quantity = orderDetail.quantity + quantity;
  }

  void increateQuantity() {
    quantity++;
  }

  void decreaseQuantity() {
    if (quantity > 0) {
      quantity--;
    }
  }
}
