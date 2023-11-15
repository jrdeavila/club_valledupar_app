import 'package:club_valledupar_app/lib.dart';
import 'package:get/get.dart';

const dashboardRoute = '/dashboard';
const resturantRoute = '/resturant';
const shoppingCartRoute = '/shopping-cart';
const orderRoute = '/order';
const reservationRoute = '/reservation';
const createReservationRoute = '/create-reservation';
const documentRoute = '/document';
const profile = '/profile';

final dashboardPages = [
  GetPage(
      name: dashboardRoute,
      page: () => const DashboardScreen(),
      binding: DashboardBindings(),
      middlewares: [
        VerifyAuth(),
        FirstLogin(),
      ]),
  GetPage(
      name: resturantRoute,
      page: () => const ResturantScreen(),
      binding: ResturantBindings(),
      middlewares: [
        VerifyAuth(),
      ]),
  GetPage(
      name: orderRoute,
      page: () => const OrderScreen(),
      binding: OrderBindings(),
      middlewares: [
        VerifyAuth(),
      ]),
  GetPage(
      name: reservationRoute,
      page: () => const ReservationScreen(),
      binding: ReservationBindings(),
      middlewares: [
        VerifyAuth(),
      ]),
  GetPage(
      name: createReservationRoute,
      page: () => const CreateReservationScreen(),
      binding: ReservationBindings(),
      middlewares: [
        VerifyAuth(),
      ]),
  GetPage(
      name: documentRoute,
      page: () => const DocumentScreen(),
      binding: DocumentBindings(),
      middlewares: [
        VerifyAuth(),
      ]),
  GetPage(name: profile, page: () => const ProfileScreen(), middlewares: [
    VerifyAuth(),
  ]),
];
