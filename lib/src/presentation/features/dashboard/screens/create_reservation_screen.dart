import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateReservationScreen extends GetView<CreateReservationController> {
  const CreateReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text('Datos de la reserva'),
        titleTextStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Get.find<ColorPalete>().textOnSecondary,
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                if (controller.errors.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Get.find<ColorPalete>().componentOnError,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "UPS!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Get.find<ColorPalete>().textOnError,
                          ),
                        ),
                        ...controller.errors.map(
                          (e) => Text(
                            "${controller.errors.indexOf(e) + 1}. $e",
                            style: TextStyle(
                              color: Get.find<ColorPalete>().textOnError,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ClockTimeCard(
                        label: 'Hora de inicio',
                        time: controller.startTime,
                        onChangeDate: (value) {
                          controller.changeStartTime(value);
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ClockTimeCard(
                        label: 'Hora de finalización',
                        time: controller.endTime,
                        onChangeDate: (value) {
                          controller.changeEndTime(value);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                DateTimeCard(
                  label: 'Fecha de la reserva',
                  date: controller.date,
                  onChangeDate: (value) {
                    controller.changeDate(value);
                  },
                ),
                const SizedBox(height: 20),
                if (controller.areas.isNotEmpty)
                  DropDownCard(
                    label: "Insumo a reservar",
                    hintText: "Selecciona un insumo",
                    labelModal: "Selecciona un insumo",
                    items: controller.areas.map(
                      (e) => DropDownCardItem(
                        id: e.id,
                        title: e.name,
                        desc: e.desc,
                      ),
                    ),
                    onChangeId: (value) {
                      controller.changeArea(value);
                    },
                  ),
                const SizedBox(height: 20),
                ...controller.radioOptions.map((e) {
                  return Row(
                    children: [
                      Radio<int>(
                        value: controller.radioOptions.indexOf(e),
                        groupValue: controller.radioValue,
                        onChanged: (value) => controller.onRadioChange(value),
                      ),
                      Text(
                        e,
                        style: TextStyle(
                          color: Get.find<ColorPalete>().textOnSecondary,
                        ),
                      ),
                    ],
                  );
                }).toList(),
                const SizedBox(height: 20),
                DropDownCard(
                    label: "Motivo",
                    hintText: "Selecciona un motivo",
                    labelModal: "Selecciona un motivo",
                    items: controller.observationsOptions.map(
                      (e) => DropDownCardItem(
                        id: controller.observationsOptions.indexOf(e),
                        title: e,
                        desc: e,
                      ),
                    ),
                    onChangeId: (value) {
                      controller.changeObservations(
                          controller.observationsOptions[value]);
                    })
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.background,
        padding: const EdgeInsets.all(20),
        child: Material(
          color: Colors.transparent,
          child: AppRoundedButton(
            padding: EdgeInsets.zero,
            radius: 20.0,
            label: 'Crear reserva',
            onTap: () {
              controller.onCreate();
            },
          ),
        ),
      ),
    );
  }
}
