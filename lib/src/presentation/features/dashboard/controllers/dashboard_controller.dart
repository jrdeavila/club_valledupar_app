import 'package:get/get.dart';

class DashboardController extends GetxController {
  final RxInt _currentIndex = RxInt(0);

  int get currentIndex => _currentIndex.value;

  void onIndexChanged(int index) {
    _currentIndex.value = index;
  }
}
