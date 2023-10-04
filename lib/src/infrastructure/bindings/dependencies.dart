import 'package:club_valledupar_app/lib.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio get dio => Dio(BaseOptions(
        baseUrl: "http://192.168.0.12/api",
        followRedirects: false,
      ))
        ..interceptors.addAll(interceptors);

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
