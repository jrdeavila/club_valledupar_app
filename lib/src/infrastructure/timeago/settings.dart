import 'package:club_valledupar_app/src/src.dart';
import 'package:injectable/injectable.dart';
import 'package:timeago/timeago.dart' as timeago;

@Injectable(as: TimeFormatService)
class TimeAgoService implements TimeFormatService {
  @override
  String formatTime(DateTime time) {
    timeago.setDefaultLocale("es");
    return timeago.format(time);
  }

  @override
  DateTime parseTime(String time) {
    return DateTime.parse(time);
  }
}
