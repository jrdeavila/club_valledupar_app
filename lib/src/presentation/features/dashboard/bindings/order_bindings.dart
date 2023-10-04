import 'package:club_valledupar_app/lib.dart';
import 'package:get/get.dart';

class OrderBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(() => OrderController());
  }
}
