import 'package:flutter/material.dart';

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
          color: Theme.of(context).colorScheme.onBackground,
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
            Row(
              children: [
                Text(time.hourOfPeriod.toString().padLeft(2, '0'),
                    style: const TextStyle(fontSize: 25)),
                const Text(' : ', style: TextStyle(fontSize: 25)),
                Text(time.minute.toString().padLeft(2, '0'),
                    style: const TextStyle(fontSize: 25)),
                Text(
                  time.period == DayPeriod.am ? ' AM' : ' PM',
                  style: const TextStyle(fontSize: 25),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
