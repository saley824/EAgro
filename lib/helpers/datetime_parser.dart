import 'package:intl/intl.dart';

class DateTimeParser {
// -------------------------from DateFormat to String-------------------------
  static String toClassicDate(DateTime dateTime) {
    DateFormat format = DateFormat("MM/dd/yyyy");
    return format.format(dateTime);
  }

  static String toDashDate(DateTime dateTime) {
    DateFormat format = DateFormat("yyyy-MM-dd");
    return format.format(dateTime);
  }
}
