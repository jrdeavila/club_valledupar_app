import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservationCard extends StatelessWidget {
  final String title;
  final String desc;
  final String startTime;
  final String endTime;
  final bool isDone;
  final String createdAt;
  final bool isEver;
  final void Function() onDelete;

  const ReservationCard({
    super.key,
    required this.title,
    required this.desc,
    required this.isDone,
    required this.createdAt,
    required this.onDelete,
    required this.startTime,
    required this.endTime,
    required this.isEver,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = Get.find<ColorPalete>().textOnSecondary;
    return GestureDetector(
      onLongPress: onDelete,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Get.find<ColorPalete>().componentColor,
          borderRadius: BorderRadius.circular(20),
        ),
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
                  Text(
                    desc,
                    style: TextStyle(
                      color: textColor,
                    ),
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
