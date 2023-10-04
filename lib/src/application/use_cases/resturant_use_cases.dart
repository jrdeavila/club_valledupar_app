import 'package:club_valledupar_app/lib.dart';
import 'package:injectable/injectable.dart' as injectable;

@injectable.injectable
class FetchSectionsUseCase {
  final RestaurantRepository _restaurantRepository;

  const FetchSectionsUseCase(this._restaurantRepository);

  Future<List<MenuSection>> fetch() {
    return _restaurantRepository.getMenuSections();
  }
}

@injectable.injectable
class CreateOrderUseCase {
  final OrderRepository _orderRepository;

  const CreateOrderUseCase(this._orderRepository);

  Future<void> create(Order order) {
    return _orderRepository.sendOrder(order);
  }
}

@injectable.injectable
class FetchOrdersUseCase {
  final OrderRepository _orderRepository;

  const FetchOrdersUseCase(this._orderRepository);

  Future<List<Order>> fetch(Partner partner) {
    return _orderRepository.getOrdersByPartner(partner);
  }
}

@injectable.injectable
class CancelOrderUseCase {
  final OrderRepository _orderRepository;

  const CancelOrderUseCase(this._orderRepository);

  Future<Order> cancel(Order order) {
    return _orderRepository.cancelOrder(order);
  }
}
