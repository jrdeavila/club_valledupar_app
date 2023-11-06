import 'package:club_valledupar_app/lib.dart';

Order orderFromJson(JSON json) => Order(
      id: json['id'].toString(),
      partner: partnerFromJson(json['partner']),
      details: List<OrderDetail>.from(
        json['products'].map((e) => orderDetailFromJson(e)),
      ),
      status: json['status'],
      address: json['address'],
      type: json['type'],
      createdAt: json['created_at'],
    );

OrderDetail orderDetailFromJson(JSON json) => OrderDetail(
      id: json['id'].toString(),
      product: menuProductFromJson(json['product']),
      quantity: json['quantity'],
      observation: json['observation'],
    );

JSON orderToJson(Order order) => {
      'id': order.id,
      'partner': order.partner.id,
      'products': List<dynamic>.from(
        order.details.map(orderDetailToJson),
      ),
      'status': order.status,
      'address': order.address,
      'type': order.type,
    };

JSON orderDetailToJson(OrderDetail orderDetail) => {
      'id': orderDetail.id,
      'product': orderDetail.product.id,
      'quantity': orderDetail.quantity,
      'observation': orderDetail.observation,
    };

List<Order> orderListFromJson(List json) => List<Order>.from(
      json.map((e) => orderFromJson(e)),
    );
