import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(index: controller.currentIndex, children: [
            const DashboardView(),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.red,
            ),
          ])),
      extendBody: true,
      bottomNavigationBar: BounceOutBottomBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        initialIndex: controller.currentIndex,
        items: const [
          Icons.home,
          Icons.search,
          Icons.shopping_cart_outlined,
          Icons.person_4,
        ],
        onIndexChanged: (value) {
          controller.onIndexChanged(value);
        },
      ),
    );
  }
}

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: _buildBackground(context),
        ),
        Align(
          alignment: Alignment.center,
          child: _buildDasboardCard(context),
        ),
        Positioned(
          top: 60,
          left: 20,
          child: Icon(
            Icons.menu,
            color: Theme.of(context).colorScheme.primary,
            size: 40,
          ),
        ),
        Positioned(
          right: 20,
          top: 60,
          child: UserAccountTag(),
        ),
        Align(
          alignment: const FractionalOffset(0.1, 0.18),
          child: Text(
            "Dashboard",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
      ],
    );
  }

  Column _buildBackground(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
              ),
            )),
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ],
    );
  }

  Container _buildDasboardCard(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.48,
      width: MediaQuery.of(context).size.width * 0.93,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Theme.of(context).colorScheme.background,
      ),
      child: GridView(
        padding: const EdgeInsets.all(16.0),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        children: [
          DashboardCard(
            title: "Menu del Restaurante",
            image: "assets/img/cartas.webp",
            onTap: () {
              Get.toNamed(resturantRoute);
            },
          ),
          DashboardCard(
            title: "Mis Pedidos",
            image: "assets/img/pedidos.jpg",
            onTap: () {
              Get.toNamed(orderRoute);
            },
          ),
          DashboardCard(
            title: "Mis Reservaciones",
            image: "assets/img/reservaciones.jpg",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
