import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Calculator {
  /// DateTime to String

  static String dateTimeToString(DateTime dateTime) {
    String formattedDate = DateFormat('dd / MM / yyyy').format(dateTime);
    return formattedDate;
  }

  /// DateTime to TimeStamp

  static Timestamp datetimeToTimeStamp(DateTime dateTime) {
    return Timestamp.fromMillisecondsSinceEpoch(dateTime.millisecondsSinceEpoch);
  }

  /// TimeStamp to DateTime

  static DateTime datetimeFromTimestamp(Timestamp timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp.seconds * 1000);
  }
}
