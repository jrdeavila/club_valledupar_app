import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetView<SessionController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textColor = Get.find<ColorPalete>().textOnPrimary;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: textColor,
        ),
      ),
      body: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/img/background-welcome.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const BlurredContainer(
              radius: 0,
            ),
            _buildPartnerData(context, textColor),
            _buildProfileActions(context),
          ],
        ),
      ),
    );
  }

  Positioned _buildProfileActions(BuildContext context) {
    return Positioned.fill(
      top: MediaQuery.of(context).size.height * 0.5,
      child: Container(
        decoration: BoxDecoration(
          color: Get.find<ColorPalete>().blurredChildColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(50),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30.0,
              ),
              child: Text(
                "Opciones de perfil",
                style: TextStyle(
                  color: Get.find<ColorPalete>().textOnPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                children: [
                  ProfileItem(
                    title: "Cerrar sesión",
                    subtitle: "Cerrar sesión de la aplicación",
                    onTap: () {
                      controller.onLogout();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned _buildPartnerData(BuildContext context, Color textColor) {
    return Positioned.fill(
      bottom: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Get.find<ColorPalete>().blurredChildColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Icon(
              Icons.person,
              color: textColor,
              size: 50,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(() => Text(
                "${controller.partner?.name}",
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          Obx(() => Text(
                "${controller.partner?.email}",
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          Obx(() => Text(
                "${controller.partner?.phone}",
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Get.find<ColorPalete>().componentColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Accion: ${controller.partner?.action}",
                style: TextStyle(
                  color: Get.find<ColorPalete>().textOnSecondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          tileColor: Get.find<ColorPalete>().componentColor,
          leading: Icon(
            Icons.logout,
            color: Get.find<ColorPalete>().textOnSecondary,
          ),
          title: Text(
            title,
            style: TextStyle(
              color: Get.find<ColorPalete>().textOnSecondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              color: Get.find<ColorPalete>().textOnSecondary,
              fontSize: 12.0,
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
