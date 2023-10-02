import 'dart:developer';

import 'package:club_valledupar_app/lib.dart';

void handlerException(
  Object exception,
  StackTrace stack,
) {
  final handler = getIt<HandlerExceptionService>();
  handler.handlerException(exception, stack);
  log("=================== Handler Exception ===================");
  log("Exception", error: exception);
}
