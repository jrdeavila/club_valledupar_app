import 'package:club_valledupar_app/lib.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TokenRepository)
class CacheTokenRepository implements TokenRepository {
  final CacheService _cacheService = getIt();

  @override
  Future<void> deleteToken() {
    return _cacheService.delete('token');
  }

  @override
  Future<String?> getToken() {
    return _cacheService.read('token');
  }

  @override
  Future<bool> hasToken() {
    return _cacheService
        .read('token')
        .then((value) => value?.isNotEmpty ?? false);
  }

  @override
  Future<void> persistToken(String token) {
    return _cacheService.save('token', token);
  }
}
