import 'package:club_valledupar_app/src/presentation/features/features.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  void goToMenu() {
    Get.toNamed(resturantRoute);
  }

  void goToReservations() {
    Get.toNamed(reservationRoute);
  }

  void goToOrders() {
    Get.toNamed(orderRoute);
  }

  void goToProfile() {
    Get.toNamed(profile);
  }

  void goToDocuments() {
    Get.toNamed(documentRoute);
  }
}
