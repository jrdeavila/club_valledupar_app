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
                      final isAccompanying =
                          controller.selectedSection?.accompanying;
                      if (isAccompanying == true) {
                        showModalBottomSheet(
                            context: context,
                            backgroundColor:
                                Get.find<ColorPalete>().componentColor,
                            builder: (context) {
                              return AccompanimentModal(
                                product: product,
                              );
                            });
                      } else {
                        Get.find<ShoppingCartController>()
                            .addProductToShopping(product);
                      }
                    },
                  )),
            );
          },
          itemCount: controller.menuProducts.length,
        ));
  }
}

class AccompanimentModal extends StatefulWidget {
  const AccompanimentModal({
    super.key,
    required this.product,
  });

  final MenuProduct product;

  @override
  State<AccompanimentModal> createState() => _AccompanimentModalState();
}

class _AccompanimentModalState extends State<AccompanimentModal> {
  int? _currentIndex;
  final List<MenuProduct> _accompaniments = [];

  final controller = Get.find<ResturantController>();
  void _onSelectMenu(int index) {
    _currentIndex = index;
    setState(() {});
  }

  void _onSelectProduct(int index) {
    var product = controller.accompanimentSections[_currentIndex!].products
        .elementAt(index);
    _accompaniments.contains(product)
        ? _accompaniments.remove(product)
        : _accompaniments.add(product);
    setState(() {});
  }

  void _onFinish() {
    Get.find<ShoppingCartController>()
        .addProductWithObservationToShopping(widget.product, _accompaniments);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    final title = _currentIndex != null
        ? controller.accompanimentSections[_currentIndex!].name
        : "Adicionales";
    return Obx(() => Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                if (_currentIndex != null)
                  BackButton(
                    color: Get.find<ColorPalete>().textOnSecondary,
                    onPressed: () {
                      _currentIndex = null;
                      setState(() {});
                    },
                  ),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Get.find<ColorPalete>().textOnSecondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: _currentIndex != null
                  ? ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemBuilder: (context, index) {
                        final item = controller
                            .accompanimentSections[_currentIndex!].products
                            .elementAt(index);

                        return GestureDetector(
                          onTap: () {
                            _onSelectProduct(index);
                          },
                          child: DropDownCardModalItem(
                            selected: _accompaniments.contains(item),
                            title: item.name,
                            desc: item.description,
                          ),
                        );
                      },
                      itemCount: controller.accompanimentSections.length,
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemBuilder: (context, index) {
                        final item = controller.accompanimentSections[index];
                        return GestureDetector(
                          onTap: () {
                            _onSelectMenu(index);
                          },
                          child: DropDownCardModalItem(
                            title: item.name,
                            desc: item.description,
                          ),
                        );
                      },
                      itemCount: controller.accompanimentSections.length,
                    ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: AppRoundedButton(
                onTap: _onFinish,
                label: "CONTINUAR",
                foregroundColor: Get.find<ColorPalete>().textOnPrimary,
                height: 60,
              ),
            ),
          ],
        ));
  }
}
