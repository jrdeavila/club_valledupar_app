import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';

class BannerStyle {
  final Color backgroundColor;
  final Color textColor;
  final IconData icon;
  final Duration duration;

  const BannerStyle({
    required this.backgroundColor,
    required this.textColor,
    required this.icon,
    required this.duration,
  });

  factory BannerStyle.success() => BannerStyle(
        backgroundColor: AppTheme.colorScheme.primary,
        textColor: AppTheme.colorScheme.onPrimary,
        icon: Icons.check_circle_outline,
        duration: const Duration(seconds: 3),
      );

  factory BannerStyle.error() => BannerStyle(
        backgroundColor: AppTheme.colorScheme.error,
        textColor: AppTheme.colorScheme.onError,
        icon: Icons.error_outline,
        duration: const Duration(seconds: 3),
      );
  factory BannerStyle.warning() => BannerStyle(
        backgroundColor: AppTheme.colorScheme.tertiary,
        textColor: AppTheme.colorScheme.onSecondary,
        icon: Icons.warning_amber_outlined,
        duration: const Duration(seconds: 3),
      );

  factory BannerStyle.info() => BannerStyle(
        backgroundColor: AppTheme.colorScheme.onBackground,
        textColor: AppTheme.colorScheme.onSecondary,
        icon: Icons.info_outline,
        duration: const Duration(seconds: 3),
      );

  factory BannerStyle.fromType(BannerType type) {
    return <BannerType, BannerStyle>{
      BannerType.success: BannerStyle.success(),
      BannerType.error: BannerStyle.error(),
      BannerType.info: BannerStyle.info(),
      BannerType.warning: BannerStyle.warning(),
    }[type]!;
  }
}
