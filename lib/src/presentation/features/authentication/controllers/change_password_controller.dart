import 'package:club_valledupar_app/lib.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  final ValidatorService _validatorService = getIt();

  final RxString _oldPassword = RxString("");
  final RxString _newPassword = RxString("");
  final RxString _confirmPassword = RxString("");
  final RxMap<String, List> _errors = RxMap();

  String get oldPassword => _oldPassword.value;
  String get newPassword => _newPassword.value;
  String get confirmPassword => _confirmPassword.value;
  List get errors => _errors.values
      .expand(
        (element) => element,
      )
      .toList();

  void onOldPasswordChanged(String value) {
    _oldPassword.value = value;
    _errors.remove("old_password");
  }

  void onNewPasswordChanged(String value) {
    _newPassword.value = value;
    _errors.remove('new_password');
  }

  void onConfirmPasswordChanged(String value) {
    _confirmPassword.value = value;
    _errors.remove("confirmed_password");
  }

  @override
  void onReady() {
    super.onReady();

    _validatorService.onListen((value) {
      _errors.value = value;
    });
  }

  void submit() {
    _validatorService.deleteErrors();
    final useCase = getIt<ChangePasswordUseCase>();
    useCase
        .changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    )
        .then((value) {
      Get.back();
      getIt<BannerService>().showBanner(BannerData(
        title: "Genial! 🥳",
        message: "Tu contraseña ha sido cambiada exitosamente",
        type: BannerType.success,
      ));
    });
  }
}
