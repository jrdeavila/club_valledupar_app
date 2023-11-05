import 'package:club_valledupar_app/lib.dart';

class Reservation {
  Reservation({
    required this.endDate,
    this.id,
    required this.insumeArea,
    required this.isEver,
    required this.isAllDay,
    required this.observations,
    required this.startDate,
    required this.user,
    this.updatedAt,
    this.createdAt,
  });

  final String endDate;
  final int? id;
  final InsumeArea insumeArea;
  final bool isEver;
  final bool isAllDay;
  final String observations;
  final String startDate;
  final String? updatedAt;
  final String? createdAt;
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
