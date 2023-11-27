import 'package:club_valledupar_app/lib.dart';

abstract class PartnerAuthenticationService {
  Future<String> authenticate(String email, String password);

  Future<void> logout();

  Future<Partner> getPartner();
}

abstract class ResetPasswordService {
  Future<void> resetPassword();
}
