import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    Get.back();
    Get.find<ResturantController>().toggleShoppingCart();
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
