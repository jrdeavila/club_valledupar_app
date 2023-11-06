import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResturantScreen extends GetView<ResturantController> {
  const ResturantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        controller.currentIndex == 0
                            ? "Restaurante"
                            : "Carrito de Compras",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Get.find<ColorPalete>().textOnPrimary,
                        ),
                      ),
                    ),
                    if (controller.currentIndex == 0)
                      IconButton(
                        onPressed: () {
                          controller.toggleShoppingCart();
                        },
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Get.find<ColorPalete>().textOnPrimary,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            leading: BackButton(
              color: Get.find<ColorPalete>().textOnPrimary,
              onPressed: () {
                if (controller.currentIndex == 1) {
                  controller.toggleShoppingCart();
                  return;
                } else {
                  Get.back();
                }
              },
            )),
        extendBodyBehindAppBar: true,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/pool.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const BlurredContainer(
              height: double.infinity,
              width: double.infinity,
            ),
            Column(
              children: [
                if (controller.currentIndex == 0)
                  const SizedBox(
                    height: 160,
                  ),
                if (controller.currentIndex == 1)
                  const SizedBox(
                    height: 30,
                  ),
                Expanded(
                  child: IndexedStack(
                    index: controller.currentIndex,
                    children: const [
                      ResturantView(),
                      ShoppingCartView(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        extendBody: true,
        bottomNavigationBar: _buildShoppingTotalChart(context),
      ),
    );
  }

  Widget _buildShoppingTotalChart(BuildContext context) {
    final ShoppingCartController shoppingCartController =
        Get.find<ShoppingCartController>();
    final textColor = Get.find<ColorPalete>().textOnSecondary;
    final bgColor = Get.find<ColorPalete>().componentColor;
    final visible = shoppingCartController.orderDetails.isNotEmpty;
    return visible
        ? Container(
            height: 180,
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            decoration: BoxDecoration(
                color: bgColor,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -3),
                  ),
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.shopping_cart,
                        color: Theme.of(context).colorScheme.primary),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("En Carrito de Compras"),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Total a Pagar",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "\$ ${shoppingCartController.total} COP",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        shoppingCartController.cancel();
                      },
                      child: const Text(
                        "Cancelar",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Material(
                      color: Colors.transparent,
                      child: AppRoundedButton(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40.0,
                        ),
                        label: controller.currentIndex == 1
                            ? "Realizar Pedido"
                            : "Ir al Carrito",
                        onTap: () {
                          if (controller.currentIndex == 0) {
                            controller.toggleShoppingCart();
                            return;
                          }
                          dialogKeyboardBuilder(
                            context,
                            Offset(
                              MediaQuery.of(context).size.width / 2,
                              MediaQuery.of(context).size.height / 2,
                            ),
                            const ConcretOrderDialogContent(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}
