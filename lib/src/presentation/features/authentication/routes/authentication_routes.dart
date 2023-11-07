import 'package:club_valledupar_app/lib.dart';
import 'package:get/get.dart';

const loginRoute = '/login';
const changePasswordRoute = '/change-password';

final authPages = [
  GetPage(
    name: loginRoute,
    page: () => const LoginScreen(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: changePasswordRoute,
    page: () => const ChangePasswordScreen(),
    binding: ChangePasswordBinding(),
  ),
];
