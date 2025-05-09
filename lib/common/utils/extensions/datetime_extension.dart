import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get toDateString {
    final day = this.day.toString().padLeft(2, '0');
    final month = toMonthName(abbreviated: true);
    final year = this.year.toString().padLeft(4, '0');

    return '$day $month $year';
  }

  String toMonthName({bool abbreviated = false}) {
    final format =
        abbreviated ? DateFormat.MMM(Intl.defaultLocale) : DateFormat.MMMM(Intl.defaultLocale);

    return format.format(this);
  }

  String get toTimeString {
    final hour = this.hour.toString().padLeft(2, '0');
    final minute = this.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  String get toFriendlyTime {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inSeconds < 60) {
      return 'just now';
    } else if (difference.inMinutes < 60) {
      final minutes = difference.inMinutes;
      return '$minutes ${minutes == 1 ? 'min' : 'mins'} ago';
    } else if (difference.inHours < 24) {
      final hours = difference.inHours;
      return '$hours ${hours == 1 ? 'hr' : 'hrs'} ago';
    } else if (difference.inDays < 7) {
      final days = difference.inDays;
      return '$days ${days == 1 ? 'day' : 'days'} ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    }
  }
}
