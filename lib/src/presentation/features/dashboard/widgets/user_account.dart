import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAccountTag extends StatelessWidget {
  const UserAccountTag({
    super.key,
    this.onTap,
    this.isSmall = false,
  });

  final VoidCallback? onTap;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    final sessionCtrl = Get.find<SessionController>();
    return GestureDetector(
      onTap: onTap,
      child: BlurredContainer(
        width: isSmall ? 50.0 : 180.0,
        height: isSmall ? 50.0 : 60.0,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!isSmall) ...[
                Text(
                  'Hola!, ${sessionCtrl.partner?.name.split(' ')[0]}',
                  style: TextStyle(
                    color: Get.find<ColorPalete>().textOnSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10.0),
              ],
              Icon(
                Icons.person,
                color: Get.find<ColorPalete>().textOnSecondary,
                size: 28,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
