import 'package:club_valledupar_app/src/src.dart';
import 'package:get/get.dart';

class SessionController extends GetxController {
  final Rx<Partner?> _partner = Rx<Partner?>(null);

  bool get isLogged => _partner.value != null;
  Partner? get partner => _partner.value;

  @override
  void onReady() {
    super.onReady();
    final GetPartnerUseCase getPartnerUseCase = getIt();
    getPartnerUseCase.getPartner().then((value) {
      _partner.value = value;
    });
  }
}
