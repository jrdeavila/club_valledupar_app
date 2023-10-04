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
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Obx(() => Column(
            children: [
              Expanded(
                child: IndexedStack(index: controller.currentIndex, children: [
                  const DashboardView(),
                  Container(
                    color: Colors.green,
                  ),
                  Container(
                    color: Colors.blue,
                  ),
                  const ProfileView(),
                ]),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          )),
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
