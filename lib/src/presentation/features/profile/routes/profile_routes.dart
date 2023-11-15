import 'package:club_valledupar_app/lib.dart';
import 'package:get/get.dart';

const updateProfileRoute = '/update-profile';

final profilePages = [
  GetPage(
    name: updateProfileRoute,
    page: () => const UpdateProfileScreen(),
    binding: UpdateProfileBinding(),
    middlewares: [
      VerifyAuth(),
    ],
  ),
];
