import 'package:club_valledupar_app/lib.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PartnerAuthenticationService)
class HttpPartnerAuthenticationService implements PartnerAuthenticationService {
  final HttpClient _httpClient;

  const HttpPartnerAuthenticationService(this._httpClient);

  @override
  Future<String> authenticate(String email, String password) {
    return _httpClient.post<JSON>(
      '/auth/login',
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) => value['data']['token']);
  }

  @override
  Future<Partner> getPartner() {
    return _httpClient.get<JSON>('/auth/me').then((value) {
      return partnerFromJson(value['data']);
    });
  }

  @override
  Future<void> logout() {
    return _httpClient.post<void>('/auth/logout');
  }
}
