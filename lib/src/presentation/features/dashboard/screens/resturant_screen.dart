import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResturantScreen extends GetView<ResturantController> {
  const ResturantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: _buildTopMenu(context),
            ),
            Expanded(
              flex: 7,
              child: IndexedStack(
                index: controller.currentIndex,
                children: [
                  ResturantView(),
                  ShoppingCartView(),
                ],
              ),
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
    final textColor = Theme.of(context).colorScheme.onSecondary;
    final bgColor = Theme.of(context).colorScheme.background;
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
                        label: "Realizar Pedido",
                        onTap: () {
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

  Padding _buildTopMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 60.0,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: _buildTopScreen(context),
          ),
        ],
      ),
    );
  }

  Row _buildTopScreen(BuildContext context) {
    final isShoppingCart = controller.currentIndex == 1;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Expanded(
          child: Text(
            isShoppingCart ? "CARRITO" : "RESTAURANTE",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        GestureDetector(
          onTap: () {
            controller.toggleShoppingCart();
          },
          child: Icon(
            isShoppingCart ? Icons.remove_shopping_cart : Icons.shopping_cart,
            color: Theme.of(context).colorScheme.primary,
            size: 30,
          ),
        ),
      ],
    );
  }
}

class ResturantView extends GetView<ResturantController> {
  const ResturantView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Expanded(
              flex: 2,
              child: Obx(
                () => ListView.builder(
                  padding: const EdgeInsets.only(left: 20.0),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final section = controller.menuSections[index];
                    return MenuCartTag(
                      title: section.name,
                      selected: controller.selectedSection?.id == section.id,
                      onTap: () => controller.selectSection(section),
                    );
                  },
                  itemCount: controller.menuSections.length,
                ),
              )),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "Menu del Dia",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 30.0,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  final product =
                      controller.selectedSection!.products.elementAt(index);
                  return ProductCardItem(
                    title: product.name,
                    desc: product.description,
                    price: product.price,
                    image: product.image,
                    onTap: () {
                      controller.addProductToShopping(product);
                    },
                  );
                },
                itemCount: controller.selectedSection?.products.length ?? 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
