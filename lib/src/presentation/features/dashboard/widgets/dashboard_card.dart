import 'dart:ui';

import 'package:flutter/material.dart';

class DashboardCard extends StatefulWidget {
  const DashboardCard({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });

  final String title;
  final String image;
  final VoidCallback onTap;

  @override
  State<DashboardCard> createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 100),
  )..addListener(() {
      setState(() {});
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) {
        _animationController.forward();
      },
      onTapUp: (_) {
        _animationController.reverse();
      },
      onTapCancel: () {
        _animationController.reverse();
      },
      child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.scale(
              scale: lerpDouble(1, 1.05, _animationController.value),
              child: child,
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.onPrimary,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: AssetImage(widget.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
