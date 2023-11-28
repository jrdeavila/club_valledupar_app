import 'package:club_valledupar_app/lib.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const domain = 'http://20.106.213.152';

@module
abstract class DioModule {
  @lazySingleton
  Dio get dio {
    return Dio(BaseOptions(
      baseUrl: "$domain/api",
      followRedirects: false,
    ))
      ..interceptors.addAll(interceptors);
  }

  List<Interceptor> get interceptors => [
        ValidatorInterceptor(),
        TokenInterceptor(),
      ];
}

@module
abstract class SharedPreferencesModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
