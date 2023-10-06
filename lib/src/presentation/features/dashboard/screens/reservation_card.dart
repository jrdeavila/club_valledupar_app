import 'package:flutter/material.dart';

class ReservationCard extends StatelessWidget {
  final String title;
  final String desc;
  final String startTime;
  final String endTime;
  final bool isDone;
  final String createdAt;
  final bool isEver;
  final int color;
  final void Function() onDelete;

  const ReservationCard({
    super.key,
    required this.title,
    required this.desc,
    required this.isDone,
    required this.createdAt,
    required this.color,
    required this.onDelete,
    required this.startTime,
    required this.endTime,
    required this.isEver,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = Colors.grey[600];
    final color = Color(this.color);
    return GestureDetector(
      onLongPress: onDelete,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: textColor),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          desc,
                          style: TextStyle(
                            color: textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "$startTime - $endTime",
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    createdAt,
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Icon(
                    isEver
                        ? Icons.pin_drop
                        : (isDone ? Icons.check : Icons.access_time),
                    color: textColor,
                    size: 40.0,
                  ),
                  Text(
                    isEver ? "Siempre" : (isDone ? "Realizada" : "Pendiente"),
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
