import 'package:club_valledupar_app/src/src.dart';
import 'package:get/get.dart';

class SessionController extends GetxController {
  final Rx<Partner?> _partner = Rx<Partner?>(null);

  bool get isLogged => _partner.value != null;
  Partner? get partner => _partner.value;

  @override
  void onReady() {
    super.onReady();
    ever(_partner, _onDataChanged);
    _getPartner();
  }

  void _onDataChanged(Partner? partner) {
    if (partner != null) {
      Get.offAllNamed(dashboardRoute);
    } else {
      Get.offAllNamed(loginRoute);
    }
  }

  void _getPartner() {
    final GetPartnerUseCase getPartnerUseCase = getIt();
    getPartnerUseCase.getPartner().then((value) {
      _partner.value = value;
    });
  }

  void onUpdateProfile(Partner partner) {
    _partner.value = partner;
  }

  void onLogin() {
    _getPartner();
  }

  void onLogout() {
    final LogoutUseCase logoutUseCase = getIt();
    logoutUseCase.logout().then((value) {
      getIt<BannerService>().showBanner(BannerData(
        title: "Sesión cerrada",
        message: "Tu sesión ha sido cerrada correctamente",
        type: BannerType.info,
      ));
      _partner.value = null;
    });
  }

  void goToChangePassword() {
    Get.toNamed(changePasswordRoute);
  }

  void resetPassword() {
    getIt<ResetPasswordUseCase>().resetPassword();
  }
}
