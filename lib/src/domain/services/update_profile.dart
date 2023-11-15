import 'package:club_valledupar_app/lib.dart';

abstract class UpdateProfileService {
  Future<Partner> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String address,
  });
}
