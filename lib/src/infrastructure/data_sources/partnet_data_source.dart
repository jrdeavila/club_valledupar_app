import 'package:club_valledupar_app/lib.dart';

Partner partnerFromJson(JSON json) {
  return Partner(
    id: json['id'].toString(),
    action: json['action'],
    name: json['name'],
    address: json['address'],
    numberPhone: json['number_phone'],
    gender: json['gender'],
    state: json['state'],
    statePartner: json['state_partner'],
    email: json['email'],
    phone: json['phone'],
    firstLogin: json['first_login'],
  );
}
