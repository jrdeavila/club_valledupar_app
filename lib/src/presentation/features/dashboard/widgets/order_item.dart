import 'package:flutter/material.dart';

class OrderCardItem extends StatelessWidget {
  const OrderCardItem({
    super.key,
    required this.title,
    required this.state,
    required this.date,
    required this.total,
    required this.image,
    this.onCancel,
    this.isCancelable = false,
  });

  final String title;
  final String state;
  final String date;
  final double total;
  final String image;
  final VoidCallback? onCancel;
  final bool isCancelable;

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSecondary;
    return Container(
      height: 200,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 0),
            ),
          ]),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      date,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                "Costo \$ ${total.toStringAsFixed(2)}",
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              _buildStateTag(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStateTag(BuildContext context) {
    var bgColor = BoxDecoration(
      color: isCancelable
          ? Theme.of(context).colorScheme.error
          : Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(20),
    );
    var textColor = isCancelable
        ? Theme.of(context).colorScheme.onError
        : Theme.of(context).colorScheme.onPrimary;
    return GestureDetector(
      onTap: isCancelable ? onCancel : null,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        decoration: bgColor,
        child: Row(
          children: [
            if (!isCancelable) ...[
              Text(
                state.toUpperCase(),
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
            if (isCancelable) ...[
              Icon(
                Icons.cancel,
                color: textColor,
              ),
              const SizedBox(width: 5),
              Text(
                "CANCELAR",
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
