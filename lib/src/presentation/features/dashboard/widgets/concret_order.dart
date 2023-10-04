import 'dart:ui';

import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConcretOrderDialogContent extends GetView<ShoppingCartController> {
  const ConcretOrderDialogContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Material(
              color: Theme.of(context).colorScheme.background,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Información adicional",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    if (controller.errors.isNotEmpty) ...[
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.error,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (final error in controller.errors)
                              Text(
                                error,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).colorScheme.onError,
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                    Row(
                      children: [
                        Expanded(
                          child: AppRoundedButton(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            radius: 12.0,
                            label: "Domicilio",
                            isBordered: !controller.isDomicile,
                            onTap: () {
                              controller.setDomicile(true);
                            },
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: AppRoundedButton(
                            radius: 12.0,
                            isBordered: controller.isDomicile,
                            label: "No Domicilio",
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            onTap: () {
                              controller.setDomicile(false);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    if (controller.isDomicile) ...[
                      AppTxtField(
                        hintText: "Dirección de entrega",
                        maxLines: 4,
                        minLines: 2,
                        prefixIcon: const Icon(
                          Icons.location_on_outlined,
                        ),
                        onChange: (value) {
                          controller.setAddress(value);
                        },
                      ),
                      const SizedBox(height: 20.0),
                    ],
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onBackground,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total a Pagar:',
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          ),
                          Text(
                            "\$ ${controller.total} COP",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    AppRoundedButton(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      radius: 12.0,
                      label: "Realizar Pedido",
                      onTap: () {
                        controller.createOrder();
                      },
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
