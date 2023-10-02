import 'package:club_valledupar_app/lib.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginCtrl());
  }
}
