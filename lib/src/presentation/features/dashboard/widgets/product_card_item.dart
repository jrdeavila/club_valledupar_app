import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCardItem extends StatelessWidget {
  const ProductCardItem({
    super.key,
    required this.title,
    required this.desc,
    required this.price,
    required this.image,
    required this.selected,
    this.onTap,
  });

  final String title;
  final String desc;
  final double price;
  final String? image;
  final VoidCallback? onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final textColor = selected
        ? Get.find<ColorPalete>().textOnSecondary
        : Get.find<ColorPalete>().textOnPrimary;
    final bgColor = selected
        ? Get.find<ColorPalete>().componentColor
        : Get.find<ColorPalete>().blurredChildColor;
    final hasImage = image != null;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: 300.milliseconds,
        height: 200.0,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            hasImage
                ? ClipRRect(
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(20),
                    ),
                    child: CachingImage(
                      fit: BoxFit.cover,
                      url: image!,
                      width: 150,
                      height: 200,
                    ),
                  )
                : SizedBox(
                    width: 150,
                    child: Center(
                      child:
                          Icon(Icons.fastfood, size: 100.0, color: textColor),
                    ),
                  ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      maxLines: 3,
                    ),
                    Text(
                      desc,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 3,
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "\$ ${currencyFormat(price)}",
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
