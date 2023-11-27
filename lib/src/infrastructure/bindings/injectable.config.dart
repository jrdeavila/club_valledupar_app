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
import 'package:shared_preferences/shared_preferences.dart' as _i19;

import '../../../lib.dart' as _i3;
import '../../application/use_cases/authentication_use_cases.dart' as _i17;
import '../../application/use_cases/profile_use_cases.dart' as _i24;
import '../../application/use_cases/request_document_use_cases.dart' as _i29;
import '../../application/use_cases/reservation_use_cases.dart' as _i30;
import '../../application/use_cases/resturant_use_cases.dart' as _i27;
import '../../domain/domain.dart' as _i13;
import '../../presentation/features/authentication/controllers/authentication_controller.dart'
    as _i10;
import '../../src.dart' as _i8;
import '../cache/cache_service.dart' as _i26;
import '../http/banner/custom_banner_service.dart' as _i4;
import '../http/cache/cache_token_repository.dart' as _i22;
import '../http/cache/cache_validador_service.dart' as _i25;
import '../http/dio/dio_client.dart' as _i7;
import '../http/dio/exceptions.dart' as _i6;
import '../http/dio/interceptors.dart' as _i21;
import '../infrastructure.dart' as _i15;
import '../repositories/http_document_repository.dart' as _i14;
import '../repositories/http_order_repository.dart' as _i11;
import '../repositories/http_reservation_repository.dart' as _i9;
import '../repositories/http_resturant_repository.dart' as _i18;
import '../services/http_change_password_service.dart' as _i28;
import '../services/http_partner_authentication_service.dart' as _i12;
import '../services/http_update_profile_service.dart' as _i23;
import '../services/reset_passsword_service.dart' as _i16;
import '../timeago/settings.dart' as _i20;
import 'dependencies.dart' as _i31;

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
    gh.factory<_i13.RequestDocumentRepository>(
        () => _i14.HttpRequestDocumentRepository(gh<_i15.HttpClient>()));
    gh.factory<_i13.RequestDocumentTypeRepository>(
        () => _i14.HttpRequestDocumentTypeRepository(gh<_i15.HttpClient>()));
    gh.factory<_i8.ReservationRepository>(
        () => _i9.HttpReservationRepository(gh<_i8.HttpClient>()));
    gh.factory<_i3.ResetPasswordService>(() => _i16.GoToResetPasswordService());
    gh.factory<_i17.ResetPasswordUseCase>(
        () => _i17.ResetPasswordUseCase(gh<_i3.ResetPasswordService>()));
    gh.factory<_i3.RestaurantRepository>(
        () => _i18.HttpResturantRepository(gh<_i3.HttpClient>()));
    await gh.factoryAsync<_i19.SharedPreferences>(
      () => sharedPreferencesModule.prefs,
      preResolve: true,
    );
    gh.factory<_i8.TimeFormatService>(() => _i20.TimeAgoService());
    gh.factory<_i21.TokenInterceptor>(() => _i21.TokenInterceptor());
    gh.factory<_i3.TokenRepository>(() => _i22.CacheTokenRepository());
    gh.factory<_i3.UpdateProfileService>(
        () => _i23.HttpUpdateProfileService(gh<_i3.HttpClient>()));
    gh.factory<_i24.UpdateProfileUseCase>(
        () => _i24.UpdateProfileUseCase(gh<_i3.UpdateProfileService>()));
    gh.factory<_i21.ValidatorInterceptor>(() => _i21.ValidatorInterceptor());
    gh.singleton<_i3.ValidatorService>(_i25.CacheValidatorService());
    gh.lazySingleton<_i26.CacheService>(
        () => _i26.CacheServiceImpl(gh<_i19.SharedPreferences>()));
    gh.factory<_i27.CancelOrderUseCase>(
        () => _i27.CancelOrderUseCase(gh<_i3.OrderRepository>()));
    gh.factory<_i3.ChangePasswordService>(
        () => _i28.HttpChangePasswordService(gh<_i3.HttpClient>()));
    gh.factory<_i17.ChangePasswordUseCase>(
        () => _i17.ChangePasswordUseCase(gh<_i3.ChangePasswordService>()));
    gh.factory<_i29.ConsultAllDocumentTypesUseCase>(() =>
        _i29.ConsultAllDocumentTypesUseCase(
            gh<_i13.RequestDocumentTypeRepository>()));
    gh.factory<_i29.ConsultAllDocumentUseCase>(() =>
        _i29.ConsultAllDocumentUseCase(gh<_i13.RequestDocumentRepository>()));
    gh.factory<_i29.CreateDocumentUseCase>(
        () => _i29.CreateDocumentUseCase(gh<_i13.RequestDocumentRepository>()));
    gh.factory<_i27.CreateOrderUseCase>(
        () => _i27.CreateOrderUseCase(gh<_i3.OrderRepository>()));
    gh.factory<_i30.CreateReservationUseCase>(
        () => _i30.CreateReservationUseCase(gh<_i13.ReservationRepository>()));
    gh.factory<_i30.DeleteReservationUseCase>(
        () => _i30.DeleteReservationUseCase(gh<_i13.ReservationRepository>()));
    gh.factory<_i30.FetchInsumeAreasUseCase>(
        () => _i30.FetchInsumeAreasUseCase(gh<_i13.InsumeAreaRepository>()));
    gh.factory<_i27.FetchOrdersUseCase>(
        () => _i27.FetchOrdersUseCase(gh<_i3.OrderRepository>()));
    gh.factory<_i30.FetchReservationsUseCase>(
        () => _i30.FetchReservationsUseCase(gh<_i13.ReservationRepository>()));
    gh.factory<_i27.FetchSectionsUseCase>(
        () => _i27.FetchSectionsUseCase(gh<_i3.RestaurantRepository>()));
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

class _$DioModule extends _i31.DioModule {}

class _$SharedPreferencesModule extends _i31.SharedPreferencesModule {}
