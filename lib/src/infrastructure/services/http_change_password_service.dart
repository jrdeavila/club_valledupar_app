import 'package:club_valledupar_app/lib.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ChangePasswordService)
class HttpChangePasswordService implements ChangePasswordService {
  final HttpClient _httpClient;

  const HttpChangePasswordService(this._httpClient);
  @override
  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) {
    return _httpClient.post<void>(
      '/auth/password/forgot',
      data: {
        'old_password': oldPassword,
        'new_password': newPassword,
        'new_password_confirmation': confirmPassword,
      },
    );
  }
}
