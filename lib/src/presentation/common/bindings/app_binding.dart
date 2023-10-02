import 'package:club_valledupar_app/lib.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SessionController>(SessionController());
  }
}
