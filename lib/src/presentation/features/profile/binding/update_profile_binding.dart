import 'package:club_valledupar_app/lib.dart';
import 'package:get/get.dart';

class UpdateProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateProfileController>(() => UpdateProfileController());
  }
}
