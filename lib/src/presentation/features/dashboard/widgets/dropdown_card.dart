import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownCard extends StatefulWidget {
  const DropDownCard({
    super.key,
    required this.label,
    required this.items,
    required this.onChangeId,
    required this.labelModal,
    required this.hintText,
  });

  final String label;
  final Iterable<DropDownCardItem> items;
  final void Function(int) onChangeId;
  final String labelModal;
  final String hintText;

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
          color: Get.find<ColorPalete>().componentColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: TextStyle(
                fontSize: 14,
                color: Get.find<ColorPalete>().textOnSecondary,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.items
                  .firstWhere((e) => e.id == _currentId,
                      orElse: () => DropDownCardItem(
                            id: 0,
                            title: widget.hintText,
                            desc: "",
                          ))
                  .title
                  .toUpperCase(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Get.find<ColorPalete>().textOnSecondary,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Get.find<ColorPalete>().componentColor,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    widget.labelModal,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Get.find<ColorPalete>().textOnSecondary,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
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
                                      color: Get.find<ColorPalete>()
                                          .componentColor,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          e.title,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Get.find<ColorPalete>()
                                                .textOnSecondary,
                                          ),
                                        ),
                                        Text(
                                          e.desc,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Get.find<ColorPalete>()
                                                .textOnSecondary,
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
