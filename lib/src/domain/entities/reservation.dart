import 'package:club_valledupar_app/lib.dart';

class Reservation {
  Reservation({
    required this.createdAt,
    required this.endDate,
    required this.id,
    required this.insumeArea,
    required this.isEver,
    required this.observations,
    required this.startDate,
    required this.typeReservation,
    required this.updatedAt,
    required this.user,
  });

  final String createdAt;
  final String endDate;
  final int id;
  final InsumeArea insumeArea;
  final bool isEver;
  final List<String> observations;
  final String startDate;
  final TypeReservation typeReservation;
  final String updatedAt;
  final Partner user;
}

class InsumeArea {
  InsumeArea({
    required this.color,
    required this.desc,
    required this.id,
    required this.name,
  });

  final String color;
  final String desc;
  final int id;
  final String name;
}

class TypeReservation {
  TypeReservation({
    required this.desc,
    required this.id,
    required this.name,
  });

  final String desc;
  final int id;
  final String name;
}
