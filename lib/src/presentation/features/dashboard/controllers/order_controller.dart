import 'package:club_valledupar_app/lib.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final RxList<Order> _orders = <Order>[].obs;

  List<Order> get orders => _orders;

  @override
  void onReady() {
    super.onReady();
    _fetchOrders();
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
}
