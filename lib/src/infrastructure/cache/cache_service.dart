import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheService {
  Future<void> save(String key, String value);
  Future<String?> read(String key);
  Future<void> delete(String key);
}

@LazySingleton(as: CacheService)
class CacheServiceImpl implements CacheService {
  final SharedPreferences _prefs;

  CacheServiceImpl(this._prefs);

  @override
  Future<void> delete(String key) async {
    await _prefs.remove(key);
  }

  @override
  Future<String?> read(String key) async {
    return _prefs.getString(key) ?? '';
  }

  @override
  Future<void> save(String key, String value) async {
    await _prefs.setString(key, value);
  }
}
