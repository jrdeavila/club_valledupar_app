import 'package:club_valledupar_app/lib.dart';

abstract class InsumeAreaRepository {
  Future<List<InsumeArea>> getInsumeAreas();
}

abstract class ReservationRepository {
  Future<List<Reservation>> getReservations(Partner partner);
  Future<Reservation> createReservation(Reservation reservation);
  Future<void> deleteReservation(Reservation id);
}

abstract class RespositoryTypesRepository {
  Future<List<TypeReservation>> getTypes();
}
