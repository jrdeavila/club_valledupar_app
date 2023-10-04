import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAccountTag extends StatelessWidget {
  const UserAccountTag({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final sessionCtrl = Get.find<SessionController>();
    return Obx(() => Container(
          decoration: BoxDecoration(
            color: Get.theme.colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            children: [
              Text(
                'Hola!, ${sessionCtrl.partner?.firstname}',
                style: TextStyle(
                  color: Get.theme.colorScheme.onSecondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10.0),
              Icon(
                Icons.person_4,
                color: Get.theme.colorScheme.primary,
                size: 28,
              ),
            ],
          ),
        ));
  }
}
