import 'package:club_valledupar_app/lib.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UpdateProfileService)
class HttpUpdateProfileService implements UpdateProfileService {
  final HttpClient _client;

  HttpUpdateProfileService(this._client);

  @override
  Future<Partner> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String address,
  }) {
    return _client.put(
      "/auth/profile",
      data: {
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
      },
    ).then((value) => partnerFromJson(value['data']));
  }
}
