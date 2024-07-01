import 'package:intl/intl.dart';

class DateTimeParser {
// -------------------------from DateFormat to String-------------------------
  static String toClassicDate(DateTime dateTime) {
    DateFormat format = DateFormat("MM/dd/yyyy");
    return format.format(dateTime);
  }
}
