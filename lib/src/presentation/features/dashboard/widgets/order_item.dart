import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderCardItem extends StatelessWidget {
  const OrderCardItem({
    super.key,
    required this.state,
    required this.type,
    required this.date,
    required this.total,
  });

  final String state;
  final String type;
  final String date;
  final double total;

  @override
  Widget build(BuildContext context) {
    final textColor = Get.find<ColorPalete>().textOnSecondary;
    final bgColor = Get.find<ColorPalete>().componentColor;
    return Container(
      height: 200,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            typeLabels[type]!.toUpperCase(),
            style: TextStyle(
              color: textColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            stateLabels[state]!.toUpperCase(),
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          const SizedBox(height: 10),
          Text(
            date,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Total \$ ${total.toStringAsFixed(2)}",
                style: TextStyle(
                  color: textColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
