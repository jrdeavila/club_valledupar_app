import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends GetView<OrderController> {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/pedidos.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const BlurredContainer(),
          Obx(() => CustomScrollView(
                slivers: [
                  SliverAppBar.large(
                    leading: BackButton(
                      color: Get.find<ColorPalete>().textOnPrimary,
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    title: const Text(
                      "Mis Pedidos",
                    ),
                    titleTextStyle: TextStyle(
                      color: Get.find<ColorPalete>().textOnPrimary,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                    ),
                    centerTitle: true,
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(16.0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final order = controller.orders[index];
                          return GestureDetector(
                            onTap: () {
                              controller.showOrderDetails(order);
                            },
                            child: OrderCardItem(
                              state: order.status,
                              type: order.type,
                              date:
                                  "Reservado ${controller.formatDate(order.createdAt!)}",
                              total: order.total,
                            ),
                          );
                        },
                        childCount: controller.orders.length,
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
