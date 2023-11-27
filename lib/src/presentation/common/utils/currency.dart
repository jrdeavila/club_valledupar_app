import 'package:intl/intl.dart';

String currencyFormat(double value) {
  return "${NumberFormat.currency(
    locale: 'en_US',
    symbol: '',
    decimalDigits: 0,
  ).format(value)} COP";
}
