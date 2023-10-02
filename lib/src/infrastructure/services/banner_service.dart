abstract class BannerService {
  void showBanner(BannerData data);

  void hideBanner();
}

enum BannerType {
  success,
  error,
  info,
  warning,
}

class BannerData {
  final String title;
  final String message;
  final BannerType type;

  BannerData({
    required this.title,
    required this.message,
    required this.type,
  });
}
