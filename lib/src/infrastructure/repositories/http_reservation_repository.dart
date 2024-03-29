import 'package:club_valledupar_app/src/src.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ReservationRepository)
class HttpReservationRepository implements ReservationRepository {
  final HttpClient _httpClient;

  HttpReservationRepository(this._httpClient);

  @override
  Future<Reservation> createReservation(Reservation reservation) {
    return _httpClient
        .post<JSON>("/reservations/${reservation.user.id}",
            data: reservationToJson(reservation))
        .then(
          (value) => reservationFromJson(value['data']),
        );
  }

  @override
  Future<void> deleteReservation(Reservation reservation) {
    return _httpClient
        .delete<void>("/reservations/${reservation.id}/${reservation.user.id}");
  }

  @override
  Future<List<Reservation>> getReservations(Partner partner) {
    return _httpClient.get<JSON>("/reservations/${partner.id}").then((value) =>
        value['data'].map<Reservation>((e) => reservationFromJson(e)).toList());
  }
}

@Injectable(as: InsumeAreaRepository)
class HttpInsumeAreaRepository implements InsumeAreaRepository {
  final HttpClient _httpClient;

  HttpInsumeAreaRepository(this._httpClient);
  @override
  Future<List<InsumeArea>> getInsumeAreas() {
    return _httpClient.get<JSON>("/insume-areas").then((value) =>
        value['data'].map<InsumeArea>((e) => insumeAreaFromJson(e)).toList());
  }
}
