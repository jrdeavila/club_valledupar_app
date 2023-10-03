import 'package:club_valledupar_app/lib.dart';
import 'package:get/get.dart';

const dashboardRoute = '/dashboard';
const resturantRoute = '/resturant';

final dashboardPages = [
  GetPage(
    name: dashboardRoute,
    page: () => const DashboardScreen(),
    binding: DashboardBindings(),
  ),
  GetPage(
    name: resturantRoute,
    page: () => const ResturantScreen(),
    binding: ResturantBindings(),
  ),
];
