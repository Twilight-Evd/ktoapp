import 'package:intl/intl.dart';

import '../../app/langs/strings.g.dart';

bool _isSameDay(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;

class UtilHelper {
  static String formatStartTime(String isoString) {
    final dateTime = DateTime.parse(isoString).toLocal();
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));
    final afterTomorrow = today.add(const Duration(days: 2));

    String dayText;
    if (_isSameDay(dateTime, today)) {
      dayText = t.sports.today;
    } else if (_isSameDay(dateTime, tomorrow)) {
      dayText = t.sports.tomorrow;
    } else if (_isSameDay(dateTime, afterTomorrow)) {
      dayText = t.sports.dayAfterTomorrow;
    } else {
      dayText = DateFormat('dd/MM/yyyy').format(dateTime);
    }

    final timeText = DateFormat('HH:mm').format(dateTime);
    return '${t.sports.startTimePrefix}$dayText $timeText';
  }
}
