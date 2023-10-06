import 'package:club_valledupar_app/lib.dart';
import 'package:get/get.dart';

const dashboardRoute = '/dashboard';
const resturantRoute = '/resturant';
const shoppingCartRoute = '/shopping-cart';
const orderRoute = '/order';
const reservationRoute = '/reservation';
const createReservationRoute = '/create-reservation';

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
  GetPage(
    name: reservationRoute,
    page: () => const ReservationScreen(),
    binding: ReservationBindings(),
  ),
  GetPage(
    name: createReservationRoute,
    page: () => const CreateReservationScreen(),
    binding: ReservationBindings(),
  ),
];
