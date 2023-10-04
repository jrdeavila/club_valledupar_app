import 'package:club_valledupar_app/lib.dart';
import 'package:get/get.dart';

class ResturantBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResturantController());
    Get.lazyPut(() => ShoppingCartController());
  }
}
