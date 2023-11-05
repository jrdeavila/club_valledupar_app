import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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

  void onCreateNew() {
    Get.toNamed(createReservationRoute);
  }

  void saveReservation(Reservation reservation) {
    _reservations.add(reservation);
  }

  List<Reservation> getByDay(DateTime day) {
    return _reservations.where((reservation) {
      var parse = dateTimeFromString(reservation.startDate);
      return (parse.day == day.day &&
              parse.month == day.month &&
              parse.year == day.year) ||
          (reservation.isEver);
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

  String hour(String dateTime) {
    final parse = dateTimeFromString(dateTime);
    return DateFormat("hh:mm a").format(parse);
  }

  int color(String value) {
    final parse = value.replaceFirst("#", "0xFF");
    return int.parse(parse);
  }

  void onDeleteReservation(Reservation reservation) {
    final deleteReservationUseCase = getIt<DeleteReservationUseCase>();
    deleteReservationUseCase(reservation).then((value) {
      _reservations.remove(reservation);
      getIt<BannerService>().showBanner(
        BannerData(
          title: "Reserva eliminada",
          message: "Reserva eliminada con exito",
          type: BannerType.info,
        ),
      );
    });
  }
}

class CreateReservationController extends GetxController {
  final radioOptions = [
    "Reservar todo el dia",
    "Repetir indefinidamente",
    "Reservacion normal"
  ];

  final observationsOptions = [
    "Otro",
    "Clases",
    "Reunion familiar",
    "Reunion de amigos",
    "Reunion de trabajo",
    "Reunion de negocios",
  ];
  final ValidatorService _validatorService = getIt<ValidatorService>();

  final Rx<TimeOfDay> _startTime = TimeOfDay(
    hour: TimeOfDay.now().hour,
    minute: 0,
  ).obs;
  final Rx<TimeOfDay> _endTime = TimeOfDay(
    hour: TimeOfDay.now().hour + 2,
    minute: 0,
  ).obs;
  final Rx<DateTime> _date = DateTime.now().obs;
  final RxList<InsumeArea> _areas = <InsumeArea>[].obs;
  final Rx<InsumeArea?> _area = Rx(null);
  late final RxString _observations = RxString(observationsOptions.first);
  final RxMap<String, List> _errors = RxMap();
  final RxInt _radioValue = 2.obs;
  final Rx<bool?> _isLoading = Rx(null);

  TimeOfDay get startTime => _startTime.value;
  TimeOfDay get endTime => _endTime.value;
  DateTime get date => _date.value;
  List<InsumeArea> get areas => _areas;
  List get errors => _errors.values.expand((element) => element).toList();
  int get radioValue => _radioValue.value;

  void onRadioChange(int? value) {
    _radioValue.value = value ?? 0;
  }

  void changeStartTime(TimeOfDay time) {
    _startTime.value = time;
    _endTime.value = TimeOfDay(
      hour: time.hour + 2,
      minute: time.minute,
    );
  }

  void changeEndTime(TimeOfDay time) {
    _endTime.value = time;
  }

  void changeDate(DateTime date) {
    _date.value = date;
  }

  void changeArea(int id) {
    final area = _areas.firstWhere((element) => element.id == id);
    _area.value = area;
  }

  void changeObservations(String value) {
    _observations.value = value;
  }

  @override
  void onReady() {
    super.onReady();
    _validatorService.onListen(
      (value) {
        _errors.addAll(value);
      },
    );

    _isLoading.listen((value) {
      if (value != null && !value) {
        Get.back();
        getIt<BannerService>().showBanner(
          BannerData(
            title: "Reserva creada",
            message: "Reserva creada con exito",
            type: BannerType.success,
          ),
        );
      }
    });
    _fetchInsumeAreas();
  }

  void _fetchInsumeAreas() {
    final fetchInsumeAreasUseCase = getIt<FetchInsumeAreasUseCase>();
    fetchInsumeAreasUseCase().then((areas) {
      _areas.addAll(areas);
      _area.value = areas.first;
    });
  }

  void onCreate() {
    _validatorService.deleteErrors();
    final partner = Get.find<SessionController>().partner!;
    final createReservationUseCase = getIt<CreateReservationUseCase>();
    final reservation = Reservation(
      user: partner,
      startDate: _dateTimeToString(date, startTime),
      endDate: _dateTimeToString(date, endTime),
      insumeArea: _area.value!,
      isEver: _radioValue.value == 1,
      isAllDay: _radioValue.value == 0,
      observations: _observations.value,
    );
    _isLoading.value = true;
    createReservationUseCase(reservation).then((value) {
      _isLoading.value = false;
      Get.find<ReservationController>().saveReservation(value);
    }).onError((error, stackTrace) {
      _isLoading.value = false;
    });
  }

  String _dateTimeToString(DateTime date, TimeOfDay time) {
    final dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    return dateTime.toIso8601String();
  }

  DateTime dateTimeFromString(String date) {
    return DateTime.parse(date);
  }
}
