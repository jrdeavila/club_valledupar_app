import 'package:club_valledupar_app/lib.dart';

class HttpOrderRepository implements OrderRepository {
  final HttpClient _httpClient;

  const HttpOrderRepository(this._httpClient);

  @override
  Future<Order> cancelOrder(Order order) {
    return _httpClient
        .put<JSON>(
          '/orders/${order.id}',
        )
        .then((value) => orderFromJson(value));
  }

  @override
  Future<List<Order>> getOrdersByPartner(Partner partner) {
    return _httpClient.get<List<JSON>>(
      '/orders',
      queryParameters: {'partner': partner.id},
    ).then((value) => orderListFromJson(value));
  }

  @override
  Future<Order> sendOrder(Order order) {
    return _httpClient
        .post<JSON>(
          '/orders',
          data: orderToJson(order),
        )
        .then((value) => orderFromJson(value));
  }

  @override
  Future<Order> updateOrder(Order order) {
    return _httpClient
        .put<JSON>(
          '/orders/${order.id}',
          data: orderToJson(order),
        )
        .then((value) => orderFromJson(value));
  }
}
