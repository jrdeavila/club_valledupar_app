import 'package:club_valledupar_app/lib.dart';
import 'package:get/get.dart';

class UpdateProfileController extends GetxController {
  final RxString _name = RxString("");
  final RxString _email = RxString("");
  final RxString _phone = RxString("");
  final RxString _address = RxString("");

  // ---------------------------------------------------------------------------

  String get name => _name.value;
  String get email => _email.value;
  String get phone => _phone.value;
  String get address => _address.value;

  // ---------------------------------------------------------------------------

  void setName(String name) => _name.value = name;
  void setEmail(String email) => _email.value = email;
  void setPhone(String phone) => _phone.value = phone;
  void setAddress(String address) => _address.value = address;

  // ---------------------------------------------------------------------------

  void updateProfile() async {
    final useCase = getIt<UpdateProfileUseCase>();

    final res = await useCase.call(
      UpdateProfileRequest(
        name: _name.value,
        email: _email.value,
        phone: _phone.value,
        address: _address.value,
      ),
    );

    Get.find<SessionController>().onUpdateProfile(res);
  }
}
