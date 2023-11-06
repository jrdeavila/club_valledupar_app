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
            const SliverToBoxAdapter(
              child: Divider(),
            ),
            const _DashboardSectionDesc(
              title: "Restaurante y Pedidos",
              desc: "Echa un vistazo a nuestros servicios internos",
              icon: Icons.swap_horiz,
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    DashboardCard(
                      image: "assets/img/delivery.jpg",
                      title: "Revisa tus pedidos",
                      onTap: () {
                        controller.goToOrders();
                      },
                    ),
                    DashboardCard(
                      image: "assets/img/waiter.jpg",
                      title: "Ordena desde cualquier lugar",
                      onTap: () {
                        controller.goToMenu();
                      },
                    ),
                  ],
                ),
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
                title: "Mira tus reservas",
                color: const Color(0xfff7edff),
                onTap: () {
                  controller.goToReservations();
                },
              ),
            )
          ],
        ),
      ],
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
