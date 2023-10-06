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
import 'package:shared_preferences/shared_preferences.dart' as _i14;

import '../../../lib.dart' as _i3;
import '../../application/use_cases/authentication_use_cases.dart' as _i23;
import '../../application/use_cases/reservation_use_cases.dart' as _i21;
import '../../application/use_cases/resturant_use_cases.dart' as _i20;
import '../../domain/domain.dart' as _i22;
import '../../presentation/features/authentication/controllers/authentication_controller.dart'
    as _i10;
import '../../src.dart' as _i8;
import '../cache/cache_service.dart' as _i19;
import '../http/banner/custom_banner_service.dart' as _i4;
import '../http/cache/cache_token_repository.dart' as _i17;
import '../http/cache/cache_validador_service.dart' as _i18;
import '../http/dio/dio_client.dart' as _i7;
import '../http/dio/exceptions.dart' as _i6;
import '../http/dio/interceptors.dart' as _i16;
import '../repositories/http_order_repository.dart' as _i11;
import '../repositories/http_reservation_repository.dart' as _i9;
import '../repositories/http_resturant_repository.dart' as _i13;
import '../services/http_partner_authentication_service.dart' as _i12;
import '../timeago/settings.dart' as _i15;
import 'dependencies.dart' as _i24;

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
    gh.factory<_i8.InsumeAreaRepository>(
        () => _i9.HttpInsumeAreaRepository(gh<_i8.HttpClient>()));
    gh.factory<List<_i5.Interceptor>>(() => dioModule.interceptors);
    gh.factory<_i10.LoginCtrl>(() => _i10.LoginCtrl());
    gh.factory<_i3.OrderRepository>(
        () => _i11.HttpOrderRepository(gh<_i3.HttpClient>()));
    gh.factory<_i3.PartnerAuthenticationService>(
        () => _i12.HttpPartnerAuthenticationService(gh<_i3.HttpClient>()));
    gh.factory<_i8.ReservationRepository>(
        () => _i9.HttpReservationRepository(gh<_i8.HttpClient>()));
    gh.factory<_i8.RespositoryTypesRepository>(
        () => _i9.HttpRespositoryTypesRepository(gh<_i8.HttpClient>()));
    gh.factory<_i3.RestaurantRepository>(
        () => _i13.HttpResturantRepository(gh<_i3.HttpClient>()));
    await gh.factoryAsync<_i14.SharedPreferences>(
      () => sharedPreferencesModule.prefs,
      preResolve: true,
    );
    gh.factory<_i8.TimeFormatService>(() => _i15.TimeAgoService());
    gh.factory<_i16.TokenInterceptor>(() => _i16.TokenInterceptor());
    gh.factory<_i3.TokenRepository>(() => _i17.CacheTokenRepository());
    gh.factory<_i16.ValidatorInterceptor>(() => _i16.ValidatorInterceptor());
    gh.singleton<_i3.ValidatorService>(_i18.CacheValidatorService());
    gh.lazySingleton<_i19.CacheService>(
        () => _i19.CacheServiceImpl(gh<_i14.SharedPreferences>()));
    gh.factory<_i20.CancelOrderUseCase>(
        () => _i20.CancelOrderUseCase(gh<_i3.OrderRepository>()));
    gh.factory<_i20.CreateOrderUseCase>(
        () => _i20.CreateOrderUseCase(gh<_i3.OrderRepository>()));
    gh.factory<_i21.CreateReservationUseCase>(
        () => _i21.CreateReservationUseCase(gh<_i22.ReservationRepository>()));
    gh.factory<_i21.FetchInsumeAreasUseCase>(
        () => _i21.FetchInsumeAreasUseCase(gh<_i22.InsumeAreaRepository>()));
    gh.factory<_i20.FetchOrdersUseCase>(
        () => _i20.FetchOrdersUseCase(gh<_i3.OrderRepository>()));
    gh.factory<_i21.FetchReservationsUseCase>(
        () => _i21.FetchReservationsUseCase(gh<_i22.ReservationRepository>()));
    gh.factory<_i20.FetchSectionsUseCase>(
        () => _i20.FetchSectionsUseCase(gh<_i3.RestaurantRepository>()));
    gh.factory<_i21.FetchTypesUseCase>(
        () => _i21.FetchTypesUseCase(gh<_i22.RespositoryTypesRepository>()));
    gh.factory<_i23.GetPartnerUseCase>(
        () => _i23.GetPartnerUseCase(gh<_i3.PartnerAuthenticationService>()));
    gh.factory<_i23.LoginUseCase>(() => _i23.LoginUseCase(
          gh<_i3.PartnerAuthenticationService>(),
          gh<_i3.TokenRepository>(),
        ));
    gh.factory<_i23.LogoutUseCase>(() => _i23.LogoutUseCase(
          gh<_i3.PartnerAuthenticationService>(),
          gh<_i3.TokenRepository>(),
        ));
    return this;
  }
}

class _$DioModule extends _i24.DioModule {}

class _$SharedPreferencesModule extends _i24.SharedPreferencesModule {}
