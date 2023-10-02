import 'package:club_valledupar_app/lib.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: TokenRepository)
class CacheTokenRepository implements TokenRepository {
  final SharedPreferences _sharedPreferences;

  const CacheTokenRepository(this._sharedPreferences);

  @override
  Future<void> deleteToken() {
    return _sharedPreferences.remove('token');
  }

  @override
  Future<String?> getToken() {
    return Future.value(_sharedPreferences.getString('token'));
  }

  @override
  Future<bool> hasToken() {
    return Future.value(_sharedPreferences.getKeys().contains('token'));
  }

  @override
  Future<void> persistToken(String token) {
    return _sharedPreferences.setString('token', token);
  }
}
