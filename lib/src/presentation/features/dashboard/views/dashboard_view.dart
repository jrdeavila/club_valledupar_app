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
            SliverToBoxAdapter(
              child: SizedBox(
                height: 400.0,
                width: MediaQuery.of(context).size.width,
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
