import 'package:club_valledupar_app/lib.dart';
import 'package:get/get.dart';

class DocumentBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocumentController>(() => DocumentController());
  }
}
