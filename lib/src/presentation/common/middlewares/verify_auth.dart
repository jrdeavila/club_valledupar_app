import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyAuth extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final sessionController = Get.find<SessionController>();
    if (sessionController.isLogged) {
      return null;
    } else {
      return const RouteSettings(name: loginRoute);
    }
  }
}
