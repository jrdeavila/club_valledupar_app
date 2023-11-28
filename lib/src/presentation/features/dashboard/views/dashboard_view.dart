import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              backgroundColor: Colors.transparent,
              toolbarHeight: 100,
              leading: Center(
                child: Image.asset(
                  'assets/logos/small-logo.png',
                  height: 80,
                ),
              ),
              leadingWidth: 100,
              actions: [
                UserAccountTag(
                  onTap: () {
                    controller.goToProfile();
                  },
                ),
                const SizedBox(width: 20),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  left: 16.0,
                  right: 16.0,
                  bottom: 50.0,
                ),
                child: Text(
                  "Bienvenido a la app del Club Social Valledupar! 🥳",
                  style: TextStyle(
                    color: Get.find<ColorPalete>().textOnSecondary,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: AlertToPayCard()),
            const SliverToBoxAdapter(
              child: Divider(),
            ),
            const _DashboardSectionDesc(
              title: "Restaurante y Pedidos",
              desc: "Echa un vistazo a nuestros servicios internos",
              icon: Icons.restaurant,
            ),
            SliverToBoxAdapter(
              child: DashboardCard(
                image: "assets/img/waiter.jpg",
                title: "Ordena desde cualquier lugar",
                onTap: () {
                  controller.goToMenu();
                },
              ),
            ),
            const SliverToBoxAdapter(
              child: Divider(),
            ),
            SliverToBoxAdapter(
              child: DashboardCard(
                image: "assets/img/delivery.jpg",
                title: "Revisa tus pedidos",
                onTap: () {
                  controller.goToOrders();
                },
              ),
            ),
            const SliverToBoxAdapter(
              child: Divider(),
            ),
            const _DashboardSectionDesc(
              title: "Insumos del club",
              desc:
                  "Reserva y utiliza los espacios del club para que disfrutes con tus amigos y familiares",
              icon: Icons.swap_horiz,
            ),
            SliverToBoxAdapter(
              child: DashboardCard(
                image: "assets/img/reservation.jpg",
                title: "Mis Reservaciones",
                onTap: () {
                  controller.goToReservations();
                },
              ),
            ),
            const SliverToBoxAdapter(
              child: Divider(),
            ),
            const _DashboardSectionDesc(
              title: "Documentación y trámites",
              desc:
                  "Solicita los documentos que necesites para realizar tus trámites",
              icon: Icons.description_outlined,
            ),
            SliverToBoxAdapter(
              child: DashboardCard(
                image: "assets/img/documents.jpg",
                title: "Ver mis solicitudes",
                color: const Color(0xfff7edff),
                onTap: () {
                  controller.goToDocuments();
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}

class AlertToPayCard extends GetView<SessionController> {
  const AlertToPayCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.partner?.state == 'I') {
        return _buildCard();
      }
      return const SizedBox.shrink();
    });
  }

  Container _buildCard() {
    return Container(
      decoration: BoxDecoration(
        color: Get.find<ColorPalete>().componentOnError,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Row(
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: Get.find<ColorPalete>().textOnError,
            size: 50.0,
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ups! Algo anda mal con tu cuenta 😥",
                  style: TextStyle(
                    color: Get.find<ColorPalete>().textOnError,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Parece que no estas al dia con tus pagos, por favor ponte en contacto con nosotros para resolver este inconveniente.",
                  style: TextStyle(
                    color: Get.find<ColorPalete>().textOnError,
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DashboardSectionDesc extends StatelessWidget {
  const _DashboardSectionDesc({
    required this.title,
    required this.desc,
    required this.icon,
  });

  final String title;
  final String desc;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Get.find<ColorPalete>().textOnSecondary,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Icon(
                  icon,
                  color: Get.find<ColorPalete>().textOnSecondary,
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Text(
              desc,
              style: TextStyle(
                color: Get.find<ColorPalete>().textOnSecondary,
                fontSize: 15.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
