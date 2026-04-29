class RDateFormatters {
  RDateFormatters._();

  static String formatDate(DateTime date) {
    final monthName = getMonthName(date.month).substring(0, 3);
    final hour = date.hour;
    final minute = date.minute;
    return '$monthName ${date.day}, $hour:$minute';
  }

  static String formatDaysLeft(DateTime date) {
    final daysLeft = DateTime.now().difference(date).inDays;
    return '$daysLeft days left';
  }

  static String formatMonthSinceSubscriptionCreated(DateTime date) {
    final now = DateTime.now();

    int months = (now.year - date.year) * 12 + (now.month - date.month);

    // Adjust if current day is before the subscription day
    if (now.day < date.day) {
      months--;
    }

    return '$months ${months == 1 ? 'month' : 'months'}';
  }

  static String getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }
}
