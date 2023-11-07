import 'package:club_valledupar_app/lib.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  final PartnerAuthenticationService _partnerAuthenticationService;
  final TokenRepository _tokenRepository;

  const LoginUseCase(
    this._partnerAuthenticationService,
    this._tokenRepository,
  );

  Future<void> login(String email, String password) async {
    final token =
        await _partnerAuthenticationService.authenticate(email, password);
    return _tokenRepository.persistToken(token);
  }
}

@injectable
class LogoutUseCase {
  final PartnerAuthenticationService _partnerAuthenticationService;
  final TokenRepository _tokenRepository;

  const LogoutUseCase(
    this._partnerAuthenticationService,
    this._tokenRepository,
  );

  Future<void> logout() async {
    _partnerAuthenticationService.logout();
    return _tokenRepository.deleteToken();
  }
}

@injectable
class GetPartnerUseCase {
  final PartnerAuthenticationService _partnerAuthenticationService;

  const GetPartnerUseCase(this._partnerAuthenticationService);

  Future<Partner> getPartner() async {
    return _partnerAuthenticationService.getPartner();
  }
}

@injectable
class ChangePasswordUseCase {
  final ChangePasswordService _changePasswordService;

  const ChangePasswordUseCase(this._changePasswordService);

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    return _changePasswordService.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );
  }
}
