import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateTimeCard extends StatelessWidget {
  const DateTimeCard({
    super.key,
    required this.date,
    required this.label,
    required this.onChangeDate,
  });

  final String label;
  final DateTime date;
  final void Function(DateTime) onChangeDate;

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('yyyy-MM-dd').format(date);
    final dayName = DateFormat('EEEE', 'es_CO').format(date).capitalize!;
    final completeDate = '$dateStr - $dayName';
    return GestureDetector(
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: date,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 30)),
        ).then((value) {
          if (value != null) {
            onChangeDate(value);
          }
        });
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Get.find<ColorPalete>().componentColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label, style: const TextStyle(fontSize: 14.0)),
            Text(
              completeDate.toUpperCase(),
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
