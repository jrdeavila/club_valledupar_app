import 'dart:ui';

import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConcretOrderDialogContent extends GetView<CreateOrderController> {
  const ConcretOrderDialogContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = Get.find<ColorPalete>().textOnPrimary;
    final errorColor = Get.find<ColorPalete>().componentOnError;
    final errorTextColor = Get.find<ColorPalete>().textOnError;

    return Obx(() {
      var isDomi = controller.orderType == "domicilio";
      var hasError = controller.errors.isNotEmpty;
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height *
              (0.5 + (isDomi ? 0.2 : 0) + (hasError ? 0.1 : 0)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Material(
              color: Colors.transparent,
              child: BlurredContainer(
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Orden final",
                        style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      if (controller.errors.isNotEmpty) ...[
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: errorColor,
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
                                    color: errorTextColor,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20.0),
                      ],
                      Text(
                        "Tipo de orden:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      ...typeLabels.entries.map((e) => Row(
                            children: [
                              Radio(
                                  value: controller.orderType,
                                  groupValue: e.key,
                                  onChanged: (value) {
                                    controller.setOrderType(e.key);
                                  }),
                              Text(e.value,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: textColor,
                                  )),
                            ],
                          )),
                      const SizedBox(height: 20.0),
                      if (isDomi) ...[
                        AppTxtField(
                          hintText: "Dirección de entrega",
                          maxLines: 4,
                          minLines: 2,
                          onChange: (value) {
                            controller.setAddress(value);
                          },
                        ),
                        const SizedBox(height: 20.0),
                      ],
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total a Pagar:',
                            style: TextStyle(
                              fontSize: 16,
                              color: textColor,
                            ),
                          ),
                          Text(
                            "\$ ${Get.find<ShoppingCartController>().total} COP",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                      if (isDomi)
                        Text(
                          "Valor total sin costo de envio",
                          style: TextStyle(
                            fontSize: 12,
                            color: textColor,
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
        ),
      );
    });
  }
}
