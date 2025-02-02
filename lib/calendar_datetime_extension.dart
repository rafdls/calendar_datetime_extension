library calendar_datetime_extension;

import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

/// An extension on the [DateTime] class that provides additional utility methods
/// for common date and time operations.
///
/// This extension includes methods for manipulating and formatting dates,
/// performing date arithmetic, and other helpful utilities that are not
/// available in the standard [DateTime] class.
extension CalendarDateTimeUtils on DateTime {
  /// Checks if the current DateTime instance is before or on the same day as the provided [dateTime].
  ///
  /// This method returns `true` if the current DateTime instance is before the provided [dateTime]
  /// or if it falls on the same day as the provided [dateTime]. Otherwise, it returns `false`.
  ///
  /// - Parameter dateTime: The DateTime instance to compare with.
  /// - Returns: A boolean value indicating whether the current DateTime instance is before or on the same day as the provided [dateTime].
  bool isBeforeOrSameDayAs(DateTime dateTime) {
    return isBefore(dateTime) || isSameDayAs(dateTime);
  }

  /// Checks if the current DateTime object is one day before the given [dateTime].
  ///
  /// Takes a [DateTime] object as input and compares it with the previous day
  /// of the current DateTime object.
  ///
  /// Returns `true` if the current DateTime object is one day before the given
  /// [dateTime], otherwise returns `false`.
  bool isOneDayBeforeOf(DateTime dateTime) {
    return isSameDayAs(dateTime.getPreviousDay());
  }

  /// Checks if the current DateTime instance is on the same day as the provided [dateTime].
  ///
  /// This method returns `true` if the current DateTime instance falls on the same day
  /// as the provided [dateTime]. Otherwise, it returns `false`.
  ///
  /// - Parameter dateTime: The DateTime instance to compare with.
  /// - Returns: A boolean value indicating whether the current DateTime instance is on the same day as the provided [dateTime].
  bool isSameDayAs(DateTime? dateTime) {
    if (dateTime == null) {
      return false;
    }
    return dateTime.day == day &&
        dateTime.month == month &&
        dateTime.year == year;
  }

  /// Checks if the given [dateTime] has the same month and year as the current instance.
  ///
  /// Takes a [DateTime] object as an argument.
  ///
  /// Returns `true` if the month and year of the given [dateTime] are the same as the current instance, otherwise returns `false`.
  bool isSameMonthYearAs(DateTime dateTime) {
    return dateTime.month == month && dateTime.year == year;
  }

  /// Returns the next weekday after the current date.
  ///
  /// This method calculates the next day using the `getNextDay` method and
  /// continues to do so until it finds a day that is not a weekend.
  ///
  /// Returns:
  ///   A [DateTime] object representing the next weekday.
  DateTime getNextWeekday() {
    DateTime nextDay = getNextDay();
    while (nextDay.isWeekend()) {
      nextDay = nextDay.getNextDay();
    }
    return nextDay;
  }

  /// Returns the previous weekday from the current DateTime instance.
  ///
  /// This method calculates the previous day and continues to check if it is a weekend.
  /// If it is a weekend, it keeps going back one day until it finds a weekday.
  ///
  /// Returns:
  ///   A DateTime object representing the previous weekday.
  DateTime getPreviousWeekday() {
    DateTime previousDay = getPreviousDay();
    while (previousDay.isWeekend()) {
      previousDay = previousDay.getPreviousDay();
    }
    return previousDay;
  }

  /// Returns the date of the next x-th weekday from the current date.
  ///
  /// The function takes an integer [x] as input, which represents the number of weekdays to skip.
  /// It returns a [DateTime] object representing the date of the next x-th weekday.
  ///
  /// Example:
  /// ```dart
  /// DateTime today = DateTime.now();
  /// DateTime nextWeekday = today.getNextXWeekday(5);
  /// print(nextWeekday); // Prints the date of the next 5th weekday from today.
  /// ```
  ///
  /// Note: This function assumes that the `getNextWeekday` method is defined and correctly returns the next weekday.
  DateTime getNextXWeekday(int x) {
    var i = x;
    var date = this;
    while (i-- > 0) {
      date = date.getNextWeekday();
    }
    return date;
  }

  /// Returns the date of the previous x-th weekday from the current date.
  ///
  /// The function takes an integer [x] as input, which represents the number of weekdays to skip.
  /// It returns a [DateTime] object representing the date of the previous x-th weekday.
  ///
  /// Example:
  /// ```dart
  /// DateTime today = DateTime.now();
  /// DateTime previousWeekday = today.getPreviousXWeekday(5);
  /// print(previousWeekday); // Prints the date of the previous 5th weekday from today.
  /// ```
  ///
  /// Note: This function assumes that the `getPreviousWeekday` method is defined and correctly returns the previous weekday.
  DateTime getPreviousXWeekday(int x) {
    var i = x;
    var date = this;
    while (i-- > 0) {
      date = date.getPreviousWeekday();
    }
    return date;
  }

  /// Returns the next day from the current DateTime instance.
  ///
  /// This method converts the current DateTime instance to UTC, adds one day,
  /// and then converts it back to local time. It also resets the time components
  /// (hour, minute, second, millisecond, microsecond) to 0.
  ///
  /// - Returns: A DateTime object representing the next day with time components reset to 0.
  DateTime getNextDay() {
    return toUtc()
        .add(
          const Duration(days: 1),
        )
        .toLocal()
        .copyWith(
          hour: 0,
          minute: 0,
          second: 0,
          millisecond: 0,
          microsecond: 0,
        );
  }

  /// Returns a [DateTime] object representing the previous day of the current [DateTime] instance.
  ///
  /// The returned [DateTime] is set to the start of the previous day (00:00:00.000).
  ///
  /// This method first converts the current [DateTime] instance to UTC, subtracts one day,
  /// and then converts it back to local time, ensuring that the time components are reset to zero.
  DateTime getPreviousDay() {
    return toUtc().subtract(const Duration(days: 1)).toLocal().copyWith(
          hour: 0,
          minute: 0,
          second: 0,
          millisecond: 0,
          microsecond: 0,
        );
  }

  /// Returns the next month from the current DateTime instance.
  ///
  /// This method clears the time components (hour, minute, second, millisecond, microsecond)
  /// of the current DateTime instance and then adds one month to it.
  ///
  /// - Returns: A DateTime object representing the same day in the next month with time components reset to 0.
  DateTime getNextMonth() {
    final clearedDate = copyWith(
      hour: 0,
      minute: 0,
      second: 0,
      millisecond: 0,
      microsecond: 0,
    );
    return Jiffy.parseFromDateTime(clearedDate).add(months: 1).dateTime;
  }

  /// Returns the date of the next x-th month from the current date.
  ///
  /// The function takes an integer [x] as input, which represents the number of months to skip.
  /// It returns a [DateTime] object representing the date of the next x-th month.
  ///
  /// Example:
  /// ```dart
  /// DateTime today = DateTime.now();
  /// DateTime nextMonth = today.getNextXMonth(5);
  /// print(nextMonth); // Prints the date of the next 5th month from today.
  /// ```
  ///
  /// Note: This function assumes that the `getNextMonth` method is defined and correctly returns the next month.
  DateTime getNextXMonth(int x) {
    var i = x;
    var date = this;
    while (i-- > 0) {
      final clearedDate = date.copyWith(
        hour: 0,
        minute: 0,
        second: 0,
        millisecond: 0,
        microsecond: 0,
      );
      date = Jiffy.parseFromDateTime(clearedDate).add(months: 1).dateTime;
    }
    return date;
  }

  /// Returns the date of the previous x-th month from the current date.
  ///
  /// The function takes an integer [x] as input, which represents the number of months to skip.
  /// It returns a [DateTime] object representing the date of the previous x-th month.
  ///
  /// Example:
  /// ```dart
  /// DateTime today = DateTime.now();
  /// DateTime previousMonth = today.getPreviousXMonth(5);
  /// print(previousMonth); // Prints the date of the previous 5th month from today.
  /// ```
  ///
  /// Note: This function assumes that the `getPreviousMonth` method is defined and correctly returns the previous month.
  DateTime getPreviousXMonth(int x) {
    var i = x;
    var date = this;
    while (i-- > 0) {
      final clearedDate = date.copyWith(
        hour: 0,
        minute: 0,
        second: 0,
        millisecond: 0,
        microsecond: 0,
      );
      date = Jiffy.parseFromDateTime(clearedDate).subtract(months: 1).dateTime;
    }
    return date;
  }

  /// Returns the previous month from the current DateTime instance.
  ///
  /// This method clears the time components (hour, minute, second, millisecond, microsecond)
  /// of the current DateTime instance and then subtracts one month from it.
  ///
  /// - Returns: A DateTime object representing the same day in the previous month with time components reset to 0.
  DateTime getPreviousMonth() {
    final clearedDate = copyWith(
      hour: 0,
      minute: 0,
      second: 0,
      millisecond: 0,
      microsecond: 0,
    );
    return Jiffy.parseFromDateTime(clearedDate).subtract(months: 1).dateTime;
  }

  /// Returns the full name of the month for the current DateTime instance.
  ///
  /// This method uses the `DateFormat.MMMM()` formatter from the `intl` package
  /// to convert the month of the current DateTime instance to its full name.
  ///
  /// - Returns: A string representing the full name of the month.
  String getMonthInWord() {
    return DateFormat.MMMM().format(this);
  }

  /// Returns a list of all the days in the month and year of the current DateTime instance.
  ///
  /// This method calculates the first day of the month and iterates through each day
  /// until it reaches the end of the month, adding each day to a list.
  ///
  /// - Returns: A list of DateTime objects representing each day in the month and year of the current DateTime instance.
  List<DateTime> getDaysOfTheMonthYear() {
    final firstDayOfTheMonth = copyWith(
      day: 1,
      hour: 0,
      minute: 0,
      second: 0,
      millisecond: 0,
      microsecond: 0,
    );
    final monthValue = month;
    final List<DateTime> daysOfTheMonth = [];
    DateTime sentryDate = firstDayOfTheMonth;
    while (sentryDate.month == monthValue) {
      daysOfTheMonth.add(sentryDate);
      sentryDate = sentryDate.add(
        const Duration(days: 1),
      );
    }
    return daysOfTheMonth;
  }

  /// Returns a list of DateTime objects representing the weekdays of the month and year
  /// of the current DateTime instance.
  ///
  /// This function filters the days of the month and year to include only weekdays.
  ///
  /// Returns:
  ///   A list of DateTime objects that are weekdays within the same month and year.
  List<DateTime> getWeekdaysOfTheMonthYear() {
    return getDaysOfTheMonthYear()
        .where(
          (element) => element.isWeekday(),
        )
        .toList();
  }

  /// Checks if the current DateTime instance falls on a weekend.
  ///
  /// Returns `true` if the day of the week is Saturday (6) or Sunday (7),
  /// otherwise returns `false`.
  bool isWeekend() {
    return weekday == 6 || weekday == 7;
  }

  /// Checks if the current DateTime object represents a weekday.
  ///
  /// Returns `true` if the current DateTime object is a weekday (Monday to Friday),
  /// and `false` otherwise.
  bool isWeekday() {
    return !isWeekend();
  }
}
