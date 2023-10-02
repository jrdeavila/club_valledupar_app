import 'package:club_valledupar_app/lib.dart';
import 'package:get/get.dart';

const loginRoute = '/login';

final authPages = [
  GetPage(
    name: loginRoute,
    page: () => const LoginScreen(),
    binding: LoginBinding(),
  )
];
