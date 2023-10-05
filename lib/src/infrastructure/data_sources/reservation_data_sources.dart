import 'package:club_valledupar_app/lib.dart';

JSON reservationToJson(Reservation data) => {
      "id": data.id,
      "user_id": data.user.id,
      "start_date": data.startDate,
      "end_date": data.endDate,
      "insume_area_id": data.insumeArea.id,
      "type_reservation_id": data.typeReservation.id,
      "is_ever": data.isEver,
      "observations": data.observations,
    };

Reservation reservationFromJson(JSON data) => Reservation(
      createdAt: data['created_at'],
      endDate: data['end_date'],
      id: data['id'],
      insumeArea: insumeAreaFromJson(data['insume_area']),
      isEver: data['is_ever'],
      observations: data['observations'].cast<String>(),
      startDate: data['start_date'],
      typeReservation: typeReservationFromJson(data['type_reservation']),
      updatedAt: data['updated_at'],
      user: partnerFromJson(data['user']),
    );

InsumeArea insumeAreaFromJson(JSON data) => InsumeArea(
      id: data['id'],
      name: data['name'],
      color: data['color'],
      desc: data['desc'],
    );

TypeReservation typeReservationFromJson(JSON data) => TypeReservation(
      id: data['id'],
      name: data['name'],
      desc: data['desc'],
    );
