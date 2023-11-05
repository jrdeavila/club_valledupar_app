import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClockTimeCard extends StatelessWidget {
  const ClockTimeCard({
    super.key,
    required this.time,
    required this.label,
    required this.onChangeDate,
  });

  final String label;
  final TimeOfDay time;
  final void Function(TimeOfDay) onChangeDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showTimePicker(
          context: context,
          initialTime: time,
        ).then((value) {
          if (value != null) {
            onChangeDate(value);
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Get.find<ColorPalete>().componentColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 14.0,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              time.format(context).toUpperCase(),
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
