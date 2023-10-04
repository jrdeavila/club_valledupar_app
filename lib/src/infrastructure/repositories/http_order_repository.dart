import 'package:club_valledupar_app/lib.dart';
import 'package:injectable/injectable.dart' as injectable;

@injectable.Injectable(as: OrderRepository)
class HttpOrderRepository implements OrderRepository {
  final HttpClient _httpClient;

  const HttpOrderRepository(this._httpClient);

  @override
  Future<Order> cancelOrder(Order order) {
    return _httpClient
        .put<JSON>(
          '/orders/${order.id}/cancel',
        )
        .then((value) => orderFromJson(value['data']));
  }

  @override
  Future<List<Order>> getOrdersByPartner(Partner partner) {
    return _httpClient
        .get<JSON>(
          '/orders/${partner.id}',
        )
        .then((value) => orderListFromJson(value['data']));
  }

  @override
  Future<Order> sendOrder(Order order) {
    return _httpClient
        .post<JSON>(
          '/orders',
          data: orderToJson(order),
        )
        .then((value) => orderFromJson(value['data']));
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
