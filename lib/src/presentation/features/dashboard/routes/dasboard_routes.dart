import 'package:club_valledupar_app/lib.dart';
import 'package:get/get.dart';

const dashboardRoute = '/dashboard';
const resturantRoute = '/resturant';
const shoppingCartRoute = '/shopping-cart';
const orderRoute = '/order';

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
  GetPage(
    name: orderRoute,
    page: () => const OrderScreen(),
    binding: OrderBindings(),
  ),
];
