import 'dart:ui';

import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlurredContainer extends StatelessWidget {
  final Widget? child;
  final double height;
  final double width;
  final double radius;
  const BlurredContainer({
    super.key,
    this.child,
    this.height = double.infinity,
    this.width = double.infinity,
    this.radius = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Get.find<ColorPalete>().blurredColor,
                  borderRadius: BorderRadius.circular(radius),
                ),
              ),
            ),
            child ?? Container(),
          ],
        ),
      ),
    );
  }
}
