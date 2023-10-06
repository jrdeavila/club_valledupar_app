import 'package:club_valledupar_app/lib.dart';
import 'package:get/get.dart';

class ReservationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReservationController>(() => ReservationController());
    Get.lazyReplace(() => CreateReservationController());
  }
}
