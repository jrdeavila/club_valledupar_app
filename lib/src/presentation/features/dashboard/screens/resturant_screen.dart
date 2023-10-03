import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResturantScreen extends GetView<ResturantController> {
  const ResturantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => Column(
        children: [
          Expanded(
            flex: 2,
            child: _buildTopMenu(context),
          ),
          Expanded(
            flex: 4,
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
                  );
                },
                itemCount: controller.selectedSection?.products.length ?? 0,
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Padding _buildTopMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 60.0,
        bottom: 20.0,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: _buildTopScreen(context),
          ),
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
        ],
      ),
    );
  }

  Row _buildTopScreen(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Text(
          "RESTAURANTE",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        const CircleAvatar(
          child: Icon(
            Icons.person,
          ),
        ),
      ],
    );
  }
}
