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
                      color: Theme.of(context).colorScheme.error,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "UPS!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onError,
                          ),
                        ),
                        ...controller.errors.map(
                          (e) => Text(
                            e,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onError,
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
                if (controller.types.isNotEmpty)
                  DropDownCard(
                    label: "Tipo de reserva",
                    items: controller.types.map(
                      (e) => DropDownCardItem(
                        id: e.id,
                        title: e.name,
                        desc: e.desc,
                      ),
                    ),
                    onChangeId: (value) {
                      controller.changeType(value);
                    },
                  ),
                const SizedBox(height: 20),
                if (controller.areas.isNotEmpty)
                  DropDownCard(
                    label: "Insumo a reservar",
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
                AppTxtField(
                  onChange: (value) {
                    controller.changeObservations(value);
                  },
                  hintText: "Observaciones",
                  minLines: 5,
                  maxLines: 5,
                ),
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

class DropDownCard extends StatefulWidget {
  const DropDownCard({
    super.key,
    required this.label,
    required this.items,
    required this.onChangeId,
  });

  final String label;
  final Iterable<DropDownCardItem> items;
  final void Function(int) onChangeId;

  @override
  State<DropDownCard> createState() => _DropDownCardState();
}

class _DropDownCardState extends State<DropDownCard> {
  late int _currentId;

  @override
  void initState() {
    super.initState();
    _currentId = widget.items.first.id;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.onBackground,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.items
                  .firstWhere((e) => e.id == _currentId,
                      orElse: () => DropDownCardItem(
                            id: 0,
                            title: "Selecciona un tipo de reserva",
                            desc: "",
                          ))
                  .title
                  .toUpperCase(),
              style: TextStyle(
                fontSize: 24,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Theme.of(context).colorScheme.onBackground,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Selecciona un tipo de reserva",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...widget.items.map(
                    (e) => GestureDetector(
                      onTap: () {
                        widget.onChangeId(e.id);
                        setState(() {
                          _currentId = e.id;
                        });
                        Get.back();
                      },
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.title,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                                ),
                                Text(
                                  e.desc,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class DropDownCardItem {
  final int id;
  final String title;
  final String desc;

  DropDownCardItem({
    required this.id,
    required this.title,
    required this.desc,
  });
}
