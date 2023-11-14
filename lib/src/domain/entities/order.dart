import 'package:club_valledupar_app/lib.dart';

class Order {
  final String id;
  final String status;
  final String? address;
  final Partner partner;
  final List<OrderDetail> details;
  final String type;
  final String? createdAt;

  Order({
    required this.id,
    required this.status,
    required this.address,
    required this.partner,
    required this.details,
    required this.type,
    this.createdAt,
  });

  double get total => details.fold(0, (total, detail) => total + detail.total);
}

class OrderDetail {
  final String id;
  final MenuProduct product;
  final String? observation;
  int quantity;

  OrderDetail({
    required this.id,
    required this.product,
    required this.quantity,
    this.observation,
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

final typeLabels = {
  "domicilio": "Domicilio",
  "club": "Interno (Club)",
  "reservacion": "Reservación",
};

final stateLabels = {
  "pendiente": "Pendiente",
  "cancelado": "Cancelado",
  "entregado": "Entregado",
  "enviado": "En Camino",
  "comandado": "En Preparación",
};
