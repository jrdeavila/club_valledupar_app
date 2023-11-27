import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends GetView<ShoppingCartController> {
  final MenuProduct product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final hasImage = product.image != null;

    final appBarTextColor = hasImage
        ? Get.find<ColorPalete>().textOnPrimary
        : Get.find<ColorPalete>().textOnSecondary;
    return Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Detalles del producto",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: appBarTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          leading: BackButton(
            color: appBarTextColor,
            onPressed: () {
              Get.back();
            },
          ),
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: hasImage
                  ? CachingImage(
                      url: product.image!,
                      fit: BoxFit.cover,
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Center(
                        child: Icon(
                          Icons.fastfood,
                          size: 100.0,
                          color: Get.find<ColorPalete>().textOnSecondary,
                        ),
                      ),
                    ),
            ),
            const Divider(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                          color: Get.find<ColorPalete>().textOnSecondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        product.description,
                        style: TextStyle(
                          color: Get.find<ColorPalete>().textOnSecondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "\$ ${currencyFormat(product.price)}",
                        style: TextStyle(
                          color: Get.find<ColorPalete>().textOnSecondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppRoundedButton(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: const Icon(Icons.remove),
                            onTap: () {
                              controller.decrementQuantityOf(product);
                            },
                          ),
                          const Spacer(),
                          Obx(() => Text(
                                "${controller.getQuantityOf(product)} Unidades",
                                style: TextStyle(
                                  color:
                                      Get.find<ColorPalete>().textOnSecondary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              )),
                          const Spacer(),
                          AppRoundedButton(
                            onTap: () {
                              controller.incrementQuantityOf(product);
                            },
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: const Icon(Icons.add),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        floatingActionButton: Obx(() {
          var currentSectionIsAccompanying =
              Get.find<ResturantController>().selectedSection?.accompanying ==
                  true;
          if (controller.getQuantityOf(product) == 0) {
            return const SizedBox.shrink();
          }
          return FloatingActionButton.extended(
            onPressed: () {
              if (currentSectionIsAccompanying) {
                showModalBottomSheet(
                    context: context,
                    backgroundColor: Get.find<ColorPalete>().componentColor,
                    builder: (context) {
                      return AccompanimentModal(
                        product: product,
                      );
                    });
              } else {
                Get.back();
                Get.find<ResturantController>().toggleShoppingCart();
              }
            },
            label: Text(
              currentSectionIsAccompanying
                  ? "Agregar acompañamiento"
                  : "Agregar al carrito",
              style: TextStyle(
                color: Get.find<ColorPalete>().textOnPrimary,
                fontSize: 18,
              ),
            ),
            icon: Icon(
              Icons.add_shopping_cart,
              color: Get.find<ColorPalete>().textOnPrimary,
            ),
          );
        }));
  }
}
