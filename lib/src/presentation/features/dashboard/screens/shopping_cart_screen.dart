import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingCartView extends GetView<ShoppingCartController> {
  const ShoppingCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.orderDetails.isEmpty) {
        final textColor = Theme.of(context).colorScheme.onSecondary;
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.shopping_cart, size: 100.0, color: textColor),
              Text(
                "No hay productos en el carrito",
                style: TextStyle(
                  fontSize: 18.0,
                  color: textColor,
                ),
              ),
            ],
          ),
        );
      }
      return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        itemBuilder: (context, index) {
          final item = controller.orderDetails[index];
          return ShoppingCartItem(
              title: item.product.name,
              price: item.product.price,
              quantity: item.quantity,
              desc: item.observation ?? item.product.description,
              onDecrease: () {
                controller.decreaseOrderDetail(item);
              },
              onIncrease: () {
                controller.increaseOrderDetail(item);
              },
              onRemove: () {
                controller.removeOrderDetail(item);
              });
        },
        itemCount: controller.orderDetails.length,
      );
    });
  }
}
