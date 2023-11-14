import 'package:intl/intl.dart';

class HumanFormats {
  static String number(double number, [int decimals = 0]) {
    final numberString = number.toString().replaceAll('.', '');
    final numberFormatted = NumberFormat.compactCurrency(
      decimalDigits: decimals,
      symbol: '',
      locale: 'en',
    ).format(double.parse(numberString));
    return numberFormatted;
  }

  static String date(DateTime date) {
    final format = DateFormat.yMMMEd('es');
    return format.format(date);
  }
}
