import 'package:club_valledupar_app/lib.dart';

Partner partnerFromJson(JSON json) => Partner(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      phone: json['phone'],
    );