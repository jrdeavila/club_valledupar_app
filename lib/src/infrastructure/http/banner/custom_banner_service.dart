import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BannerService)
class CustomBannerService implements BannerService {
  @override
  void hideBanner() {
    Get.closeAllSnackbars();
  }

  @override
  void showBanner(BannerData data) {
    final style = BannerStyle.fromType(data.type);
    final snackbar =
        snackBar(title: data.title, message: data.message, style: style);
    Get.showSnackbar(snackbar);
  }
}

GetSnackBar snackBar({
  required String title,
  required String message,
  required BannerStyle style,
}) =>
    GetSnackBar(
      borderRadius: 20.0,
      margin: const EdgeInsets.all(20),
      titleText: Text(
        title,
        style: TextStyle(
          color: style.textColor,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        message,
        style: TextStyle(
          color: style.textColor,
        ),
      ),
      icon: Icon(
        style.icon,
        color: style.textColor,
      ),
      backgroundColor: style.backgroundColor,
      duration: const Duration(seconds: 3),
    );
