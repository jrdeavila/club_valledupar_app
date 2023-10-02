import 'package:club_valledupar_app/src/src.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCtrl extends GetxController {
  late final _validatorService = getIt<ValidatorService>();
  late final loginUseCase = getIt<LoginUseCase>();
  final RxString _email = RxString("");
  final RxString _password = RxString("");
  final RxBool _rememberMe = RxBool(false);

  final RxMap<String, List> _errors = RxMap({});

  List<String> errors(String key) => _errors[key]?.cast<String>() ?? [];
  bool get rememberMe => _rememberMe.value;

  void setEmail(String value) => _email.value = value;
  void setPassword(String value) => _password.value = value;
  void setRememberMe(bool? value) => _rememberMe.value = value ?? false;

  @override
  void onReady() {
    super.onReady();

    _validatorService.onListen((p0) {
      _errors.value = p0;
    });
  }

  void submit() {
    _validatorService.deleteErrors();
    loginUseCase.login(
      _email.value,
      _password.value,
    );
  }
}
