import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResturantView extends GetView<ResturantController> {
  const ResturantView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        _buildSectionCategories(),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Menu del Dia",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: AppTxtField(
            prefixIcon: const Icon(Icons.search),
            suffixIcon: GestureDetector(
              onTap: () {
                controller.searchProduct("");
              },
              child: const Icon(Icons.close),
            ),
            hintText: "Buscar producto en el menu",
            onChange: (value) {
              controller.searchProduct(value);
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Expanded(
          child: ListOfProducts(),
        ),
      ],
    );
  }

  Widget _buildSectionCategories() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DropDownCard(
        label: "Categoria",
        innerWidgets: [
          AppTxtField(
            prefixIcon: const Icon(Icons.search),
            hintText: "Buscar categoria",
            onChange: (value) => controller.searchSection(value),
          ),
        ],
        items: controller.menuSections.map(
          (e) => DropDownCardItem(
            id: controller.menuSections.indexOf(e),
            title: e.name,
            desc: () {
              if (e.isAccompaniment) {
                return "Adicionales";
              }
              if (e.accompanying) {
                return "Platos Fuertes";
              }
              return e.description;
            }(),
          ),
        ),
        onChangeId: (value) {
          final item = controller.menuSections[value];
          controller.selectSection(item);
        },
        labelModal: "Selecciona una categoria",
        hintText: "Buscar categoria",
      ),
    );
  }
}

class ListOfProducts extends GetView<ResturantController> {
  const ListOfProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) {
            final product = controller.menuProducts.elementAt(index);
            return Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Obx(() => ProductCardItem(
                    selected: Get.find<ShoppingCartController>()
                        .productIsInShoppingCart(product),
                    title: product.name,
                    desc: product.description,
                    price: product.price,
                    image: product.image,
                    onTap: () {
                      controller.showDetails(product);
                    },
                  )),
            );
          },
          itemCount: controller.menuProducts.length,
        ));
  }
}
