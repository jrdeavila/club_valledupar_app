import 'package:club_valledupar_app/src/domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateReservationUseCase {
  final ReservationRepository _reservationRepository;

  CreateReservationUseCase(this._reservationRepository);

  Future<Reservation> call(Reservation reservation) async {
    return await _reservationRepository.createReservation(reservation);
  }
}

@injectable
class FetchReservationsUseCase {
  final ReservationRepository _reservationRepository;

  FetchReservationsUseCase(this._reservationRepository);

  Future<List<Reservation>> call(Partner partner) async {
    return await _reservationRepository.getReservations(partner);
  }
}

@injectable
class FetchInsumeAreasUseCase {
  final InsumeAreaRepository _insumeAreaRepository;

  FetchInsumeAreasUseCase(this._insumeAreaRepository);

  Future<List<InsumeArea>> call() async {
    return await _insumeAreaRepository.getInsumeAreas();
  }
}
