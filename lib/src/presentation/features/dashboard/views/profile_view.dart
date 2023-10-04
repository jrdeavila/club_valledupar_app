import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<SessionController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: const FractionalOffset(
            0.5,
            0.2,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Icon(
                  Icons.person,
                  color: Theme.of(context).colorScheme.onSecondary,
                  size: 50,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${controller.partner!.firstname} ${controller.partner!.lastname}",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          top: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text(
                  "Cerrar sesión",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Cerrar sesión de la aplicación",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 12.0,
                  ),
                ),
                onTap: () {
                  controller.onLogout();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
