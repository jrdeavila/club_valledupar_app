import 'package:club_valledupar_app/lib.dart';
import 'package:get/get.dart';

const dashboardRoute = '/dashboard';

final dashboardPages = [
  GetPage(
    name: dashboardRoute,
    page: () => const DashboardScreen(),
    binding: DashboardBindings(),
  ),
];
