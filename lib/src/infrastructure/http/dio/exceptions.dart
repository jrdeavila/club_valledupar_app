import 'package:club_valledupar_app/lib.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HandlerExceptionService)
class DioHandlerExcepton implements HandlerExceptionService {
  final BannerService _bannerService = getIt();
  Map<int, BannerData> codes = {
    401: BannerData(
      title: "No autenticado",
      message: "Debes iniciar sesión para acceder a este recurso",
      type: BannerType.warning,
    ),
    403: BannerData(
      title: "Prohibido",
      message: "No tienes permisos para acceder a este recurso",
      type: BannerType.warning,
    ),
    404: BannerData(
      title: "No encontrado",
      message: "No se ha encontrado el recurso solicitado",
      type: BannerType.error,
    ),
    422: BannerData(
      title: "Datos incorrectos",
      message: "Los datos ingresados no son correctos",
      type: BannerType.error,
    ),
    500: BannerData(
      title: "Error interno",
      message: "Ha ocurrido un error interno en el servidor",
      type: BannerType.error,
    ),
  };

  @override
  void handlerException(Object exception, StackTrace stack) {
    if (exception is DioException &&
        exception.type == DioExceptionType.badResponse) {
      if (exception.response?.statusCode == 400) {
        final data = exception.response?.data;
        if (data != null) {
          _bannerService.showBanner(BannerData(
            title: "Proceso fallido",
            message: data["message"],
            type: BannerType.warning,
          ));
        }
      } else {
        final data = codes[exception.response!.statusCode];
        if (data != null) {
          _bannerService.showBanner(data);
        }
      }
    }

    if (exception is DioException &&
        exception.type == DioExceptionType.connectionError) {
      _bannerService.showBanner(BannerData(
        title: "Error de conexión",
        message: "No se ha podido conectar con el servidor",
        type: BannerType.error,
      ));
    }
  }
}
