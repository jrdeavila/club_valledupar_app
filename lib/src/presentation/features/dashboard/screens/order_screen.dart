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
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(color: Theme.of(context).colorScheme.primary),
              ),
              Expanded(
                flex: 3,
                child:
                    Container(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ],
          ),
          Obx(() => CustomScrollView(
                slivers: [
                  SliverAppBar(
                    floating: true,
                    toolbarHeight: 120,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    leadingWidth: 76.0,
                    leading: GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Theme.of(context).colorScheme.onPrimary,
                        size: 30.0,
                      ),
                    ),
                    title: const Text("Tus Pedidos"),
                    titleTextStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                    actions: const [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 8.0,
                          right: 16.0,
                        ),
                        child: UserAccountTag(
                          isSmall: true,
                        ),
                      ),
                    ],
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(16.0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final order = controller.orders[index];
                          return OrderCardItem(
                            title: "Orden #${order.id}",
                            state: order.status,
                            isCancelable: order.status == "pendiente",
                            date: controller.formatDate(order.createdAt!),
                            total: order.total,
                            image: order.details.first.product.image,
                            onCancel: () {
                              controller.cancelOrder(order);
                            },
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
