import 'package:club_valledupar_app/lib.dart';

Partner partnerFromJson(JSON json) => Partner(
      id: json['id'].toString(),
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      phone: json['phone'],
    );

JSON partnerToJson(Partner partner) => {
      'id': partner.id,
      'firstname': partner.firstname,
      'lastname': partner.lastname,
      'email': partner.email,
      'phone': partner.phone,
    };
