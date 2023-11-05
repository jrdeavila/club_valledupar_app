import 'package:flutter/material.dart';

class ReservationDetailsCard extends StatelessWidget {
  const ReservationDetailsCard({
    super.key,
    required this.title,
    required this.count,
    required this.icon,
    required this.color,
    required this.bgColor,
  });

  final String title;
  final int count;
  final IconData icon;
  final Color color;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 120,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  )),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 30,
                    color: color,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "($count)",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: color,
                  fontSize: 22.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
