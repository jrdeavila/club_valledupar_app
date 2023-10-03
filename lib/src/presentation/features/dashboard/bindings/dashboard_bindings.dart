import 'package:club_valledupar_app/lib.dart';
import 'package:get/get.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
  }
}
