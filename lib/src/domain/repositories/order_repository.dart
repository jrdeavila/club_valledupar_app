import 'package:club_valledupar_app/lib.dart';

abstract class OrderRepository {
  Future<List<Order>> getOrdersByPartner(Partner partner);
  Future<Order> sendOrder(Order order);
  Future<Order> updateOrder(Order order);
  Future<Order> cancelOrder(Order order);
}
