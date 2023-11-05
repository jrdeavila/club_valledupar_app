import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        leading: Image.asset("assets/logos/small-logo.png"),
        leadingWidth: 100,
        titleSpacing: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Club Social Valledupar",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w900,
                color: Get.find<ColorPalete>().textOnPrimary,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 1,
              textAlign: TextAlign.start,
            ),
            Text(
              "Plataforma de socios",
              style: TextStyle(
                fontSize: 18,
                color: Get.find<ColorPalete>().textOnPrimary,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        titleTextStyle: const TextStyle());
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
