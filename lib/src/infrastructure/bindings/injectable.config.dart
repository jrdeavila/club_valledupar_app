// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i11;

import '../../../lib.dart' as _i3;
import '../../application/use_cases/authentication_use_cases.dart' as _i17;
import '../../application/use_cases/resturant_use_cases.dart' as _i16;
import '../../presentation/features/authentication/controllers/authentication_controller.dart'
    as _i8;
import '../cache/cache_service.dart' as _i15;
import '../http/banner/custom_banner_service.dart' as _i4;
import '../http/cache/cache_token_repository.dart' as _i13;
import '../http/cache/cache_validador_service.dart' as _i14;
import '../http/dio/dio_client.dart' as _i7;
import '../http/dio/exceptions.dart' as _i6;
import '../http/dio/interceptors.dart' as _i12;
import '../repositories/http_resturant_repository.dart' as _i10;
import '../services/http_partner_authentication_service.dart' as _i9;
import 'dependencies.dart' as _i18;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    final sharedPreferencesModule = _$SharedPreferencesModule();
    gh.factory<_i3.BannerService>(() => _i4.CustomBannerService());
    gh.lazySingleton<_i5.Dio>(() => dioModule.dio);
    gh.factory<_i3.HandlerExceptionService>(() => _i6.DioHandlerExcepton());
    gh.factory<_i3.HttpClient>(() => _i7.DioHttpClient(gh<_i5.Dio>()));
    gh.factory<List<_i5.Interceptor>>(() => dioModule.interceptors);
    gh.factory<_i8.LoginCtrl>(() => _i8.LoginCtrl());
    gh.factory<_i3.PartnerAuthenticationService>(
        () => _i9.HttpPartnerAuthenticationService(gh<_i3.HttpClient>()));
    gh.factory<_i3.RestaurantRepository>(
        () => _i10.HttpResturantRepository(gh<_i3.HttpClient>()));
    await gh.factoryAsync<_i11.SharedPreferences>(
      () => sharedPreferencesModule.prefs,
      preResolve: true,
    );
    gh.factory<_i12.TokenInterceptor>(() => _i12.TokenInterceptor());
    gh.factory<_i3.TokenRepository>(() => _i13.CacheTokenRepository());
    gh.factory<_i12.ValidatorInterceptor>(() => _i12.ValidatorInterceptor());
    gh.singleton<_i3.ValidatorService>(_i14.CacheValidatorService());
    gh.lazySingleton<_i15.CacheService>(
        () => _i15.CacheServiceImpl(gh<_i11.SharedPreferences>()));
    gh.factory<_i16.FetchSectionsUseCase>(
        () => _i16.FetchSectionsUseCase(gh<_i3.RestaurantRepository>()));
    gh.factory<_i17.GetPartnerUseCase>(
        () => _i17.GetPartnerUseCase(gh<_i3.PartnerAuthenticationService>()));
    gh.factory<_i17.LoginUseCase>(() => _i17.LoginUseCase(
          gh<_i3.PartnerAuthenticationService>(),
          gh<_i3.TokenRepository>(),
        ));
    gh.factory<_i17.LogoutUseCase>(() => _i17.LogoutUseCase(
          gh<_i3.PartnerAuthenticationService>(),
          gh<_i3.TokenRepository>(),
        ));
    return this;
  }
}

class _$DioModule extends _i18.DioModule {}

class _$SharedPreferencesModule extends _i18.SharedPreferencesModule {}
