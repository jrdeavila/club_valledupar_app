import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailsScreen extends GetView<OrderController> {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final order = controller.selectedOrder;
      final isPending = order.status == "pendiente";
      return Scaffold(
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
            const BlurredContainer(
              radius: 0,
            ),
            CustomScrollView(
              slivers: [
                SliverAppBar.large(
                  leading: BackButton(
                    color: Get.find<ColorPalete>().textOnPrimary,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Detalles del pedido",
                      ),
                      Text(
                        "(${stateLabels[order.status]!.toUpperCase()})",
                        style: TextStyle(
                          color: Get.find<ColorPalete>().textOnPrimary,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        ),
                      )
                    ],
                  ),
                  titleTextStyle: TextStyle(
                    color: Get.find<ColorPalete>().textOnPrimary,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                  ),
                  centerTitle: true,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final orderDetail = order.details[index];
                      return OrderDetailCardItem(
                        orderDetail: orderDetail,
                      );
                    },
                    childCount: order.details.length,
                  ),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: isPending
            ? FloatingActionButton.extended(
                onPressed: () {
                  controller.cancelOrder(order);
                },
                label: const Text("Cancelar pedido"),
                icon: const Icon(Icons.cancel),
                backgroundColor: Get.find<ColorPalete>().componentColor,
                foregroundColor: Get.find<ColorPalete>().textOnSecondary,
              )
            : null,
      );
    });
  }
}

class OrderDetailCardItem extends StatelessWidget {
  final OrderDetail orderDetail;
  const OrderDetailCardItem({
    super.key,
    required this.orderDetail,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = Get.find<ColorPalete>().componentColor;
    final textColor = Get.find<ColorPalete>().textOnSecondary;

    return Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              orderDetail.product.name,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
              ),
            ),
            Text(
              "${orderDetail.quantity} Unidades",
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            if (orderDetail.observation != null)
              Text(
                orderDetail.observation!,
                style: TextStyle(
                  color: textColor,
                  fontSize: 14.0,
                ),
                maxLines: 2,
              ),
            Text(
              "\$ ${orderDetail.product.price}",
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.end,
            ),
          ],
        ));
  }
}
