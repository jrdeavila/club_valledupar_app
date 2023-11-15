import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstLogin extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final sessionController = Get.find<SessionController>();
    if (sessionController.partner?.firstLogin == true) {
      return const RouteSettings(name: updateProfileRoute);
    } else {
      return null;
    }
  }
}
