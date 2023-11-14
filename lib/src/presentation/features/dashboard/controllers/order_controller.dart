import 'dart:async';

import 'package:club_valledupar_app/lib.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  late Timer timer;
  // -----------------------------------------------------------------

  final RxList<Order> _orders = <Order>[].obs;
  final Rx<Order?> _selectedOrder = Rx<Order?>(null);

  // -----------------------------------------------------------------

  List<Order> get orders => _orders;
  Order get selectedOrder => _selectedOrder.value!;

  // -----------------------------------------------------------------

  @override
  void onReady() {
    super.onReady();
    _fetchOrders();
    timer = Timer.periodic(30.seconds, (timer) {
      _fetchOrders();
    });
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }

  void _fetchOrders() {
    final fetchOrdersUseCase = getIt<FetchOrdersUseCase>();
    final partner = Get.find<SessionController>().partner;
    fetchOrdersUseCase.fetch(partner!).then((value) {
      _orders.value = value;
    });
  }

  void cancelOrder(Order order) {
    final cancelOrderUseCase = getIt<CancelOrderUseCase>();
    cancelOrderUseCase.cancel(order).then((value) {
      _selectedOrder.value = value;
      final index = _orders.indexWhere((element) => element.id == value.id);
      _orders[index] = value;
      _orders.refresh();
    });
  }

  String formatDate(String date) {
    var timeFormatService = getIt<TimeFormatService>();
    final datetime = timeFormatService.parseTime(date);
    return timeFormatService.formatTime(datetime);
  }

  void showOrderDetails(Order order) {
    _selectedOrder.value = order;
    Get.to(() => const OrderDetailsScreen());
  }
}
