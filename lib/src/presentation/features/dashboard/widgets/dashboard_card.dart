import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
    this.color = Colors.white,
  });

  final String image;
  final String title;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 350,
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Column(
          children: [
            Image.asset(
              image,
              height: 250.0,
              // Save cache image
              cacheHeight: 250,
            ),
            const SizedBox(height: 10.0),
            Text(
              title,
              style: TextStyle(
                color: Get.find<ColorPalete>().textOnSecondary,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
