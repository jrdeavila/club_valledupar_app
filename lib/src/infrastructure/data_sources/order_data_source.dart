import 'package:club_valledupar_app/lib.dart';

Order orderFromJson(JSON json) => Order(
      id: json['id'],
      partner: json['partner'],
      details: List<OrderDetail>.from(
        json['products'].map(orderDetailFromJson),
      ),
      status: json['status'],
      address: json['address'],
    );

OrderDetail orderDetailFromJson(JSON json) => OrderDetail(
      id: json['id'],
      product: menuProductFromJson(json['product']),
      quantity: json['quantity'],
    );

JSON orderToJson(Order order) => {
      'id': order.id,
      'partner': order.partner,
      'products': List<dynamic>.from(
        order.details.map(orderDetailToJson),
      ),
      'status': order.status,
      'address': order.address,
    };

JSON orderDetailToJson(OrderDetail orderDetail) => {
      'id': orderDetail.id,
      'product': menuProductToJson(orderDetail.product),
      'quantity': orderDetail.quantity,
    };

List<Order> orderListFromJson(List<JSON> json) => List<Order>.from(
      json.map(orderFromJson),
    );
