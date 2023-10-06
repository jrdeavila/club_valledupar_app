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
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label, style: const TextStyle(fontSize: 14.0)),
            Row(
              children: [
                Text(date.day.toString().padLeft(2, '0'),
                    style: const TextStyle(fontSize: 30)),
                const Text(' / ', style: TextStyle(fontSize: 30)),
                Text(date.month.toString().padLeft(2, '0'),
                    style: const TextStyle(fontSize: 30)),
                const Text(' / ', style: TextStyle(fontSize: 30)),
                Text(
                  date.year.toString(),
                  style: const TextStyle(fontSize: 30),
                ),
                const Text(' - ', style: TextStyle(fontSize: 30)),
                // Day Name
                Text(
                  DateFormat('EEEE', 'es_CO').format(date).capitalize!,
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
