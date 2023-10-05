import 'package:club_valledupar_app/lib.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class ReservationController extends GetxController {
  final RxList<Reservation> _reservations = <Reservation>[].obs;
  final Rx<CalendarFormat> _calendarFormat =
      CalendarFormat.week.obs; // CalendarFormat.month.obs;

  final Rx<DateTime> _focusedDay = DateTime.now().obs;

  DateTime get focusedDay => _focusedDay.value;
  List<Reservation> get reservations => _reservations;
  List<Reservation> get reservationsByDay => getByDay(_focusedDay.value);
  List<Reservation> get pendingReservations => _reservations
      .where((reservation) => !isDone(reservation.endDate))
      .toList();
  List<Reservation> get doneReservations => _reservations.where((reservation) {
        return isDone(reservation.endDate);
      }).toList();

  CalendarFormat get calendarFormat => _calendarFormat.value;

  void changeFocusedDay(DateTime day) {
    _focusedDay.value = day;
  }

  void changeCalendarFormat(CalendarFormat format) {
    _calendarFormat.value = format;
  }

  @override
  void onReady() {
    super.onReady();
    _fetchReservations();
  }

  void _fetchReservations() {
    final partner = Get.find<SessionController>().partner!;
    final fetchReservationsUseCase = getIt<FetchReservationsUseCase>();

    fetchReservationsUseCase(partner).then((reservations) {
      _reservations.addAll(reservations);
    });
  }

  List<Reservation> getByDay(DateTime day) {
    return _reservations.where((reservation) {
      var parse = dateTimeFromString(reservation.startDate);
      return parse.day == day.day &&
          parse.month == day.month &&
          parse.year == day.year;
    }).toList();
  }

  bool isDone(String endDate) {
    final parse = dateTimeFromString(endDate);
    return parse.isBefore(DateTime.now());
  }

  String timeAgo(String time) {
    final parse = dateTimeFromString(time);
    final timeFormatService = getIt<TimeFormatService>();
    return timeFormatService.formatTime(parse);
  }

  int color(String value) {
    final parse = value.replaceFirst("#", "0xFF");
    return int.parse(parse);
  }
}
