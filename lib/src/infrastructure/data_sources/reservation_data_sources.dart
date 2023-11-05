import 'package:club_valledupar_app/lib.dart';

JSON reservationToJson(Reservation data) => {
      "id": data.id,
      "user_id": data.user.id,
      "start_date": data.startDate,
      "end_date": data.endDate,
      "insume_area_id": data.insumeArea.id,
      "is_ever": data.isEver,
      'is_all_day': data.isAllDay,
      "observations": data.observations,
    };

Reservation reservationFromJson(JSON data) => Reservation(
      createdAt: data['created_at'],
      endDate: data['end_date'],
      id: data['id'],
      insumeArea: insumeAreaFromJson(data['insume_area']),
      isEver: data['is_ever'],
      isAllDay: data['is_all_day'],
      observations: data['observations'],
      startDate: data['start_date'],
      updatedAt: data['updated_at'],
      user: partnerFromJson(data['user']),
    );

InsumeArea insumeAreaFromJson(JSON data) => InsumeArea(
      id: data['id'],
      name: data['name'],
      color: data['color'],
      desc: data['desc'],
    );
