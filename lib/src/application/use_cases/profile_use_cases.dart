import 'package:club_valledupar_app/lib.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateProfileUseCase {
  final UpdateProfileService _updateProfileService;

  UpdateProfileUseCase(this._updateProfileService);

  Future<Partner> call(UpdateProfileRequest params) {
    return _updateProfileService.updateProfile(
      name: params.name,
      email: params.email,
      phone: params.phone,
      address: params.address,
    );
  }
}
