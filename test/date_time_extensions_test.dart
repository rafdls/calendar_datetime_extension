import 'package:flutter_test/flutter_test.dart';
import 'package:date_time_extensions/date_time_extensions.dart';

void main() {
  group('DateUtils Extension', () {
    test('isBeforeOrSameDayAs', () {
      final date1 = DateTime(2023, 10, 10);
      final date2 = DateTime(2023, 10, 11);
      final date3 = DateTime(2023, 10, 10);

      expect(date1.isBeforeOrSameDayAs(date2), isTrue);
      expect(date2.isBeforeOrSameDayAs(date1), isFalse);
      expect(date1.isBeforeOrSameDayAs(date3), isTrue);
    });

    test('isOneDayBeforeOf', () {
      final date1 = DateTime(2023, 10, 10);
      final date2 = DateTime(2023, 10, 11);

      expect(date1.isOneDayBeforeOf(date2), isTrue);
      expect(date2.isOneDayBeforeOf(date1), isFalse);
    });

    test('isSameDayAs', () {
      final date1 = DateTime(2023, 10, 10);
      final date2 = DateTime(2023, 10, 10);
      final date3 = DateTime(2023, 10, 11);

      expect(date1.isSameDayAs(date2), isTrue);
      expect(date1.isSameDayAs(date3), isFalse);
    });

    test('isSameMonthYearAs', () {
      final date1 = DateTime(2023, 10, 10);
      final date2 = DateTime(2023, 10, 15);
      final date3 = DateTime(2023, 11, 10);

      expect(date1.isSameMonthYearAs(date2), isTrue);
      expect(date1.isSameMonthYearAs(date3), isFalse);
    });

    test('getNextWeekday', () {
      final friday = DateTime(2023, 10, 13);
      final nextWeekday = friday.getNextWeekday();

      expect(nextWeekday.weekday, equals(DateTime.monday));
    });

    test('getPreviousWeekday', () {
      final monday = DateTime(2023, 10, 16);
      final previousWeekday = monday.getPreviousWeekday();

      expect(previousWeekday.weekday, equals(DateTime.friday));
    });

    test('getNextXWeekday', () {
      final monday = DateTime(2023, 10, 16);
      final next5thWeekday = monday.getNextXWeekday(5);

      expect(next5thWeekday.weekday, equals(DateTime.monday));
    });

    test('getPreviousXWeekday', () {
      final monday = DateTime(2023, 10, 16);
      final previous5thWeekday = monday.getPreviousXWeekday(5);

      expect(previous5thWeekday.weekday, equals(DateTime.monday));
    });

    test('getNextDay', () {
      final date = DateTime(2023, 10, 10);
      final nextDay = date.getNextDay();

      expect(nextDay.day, equals(11));
    });

    test('getPreviousDay', () {
      final date = DateTime(2023, 10, 10);
      final previousDay = date.getPreviousDay();

      expect(previousDay.day, equals(9));
    });

    test('getNextMonth', () {
      final date = DateTime(2023, 10, 10);
      final nextMonth = date.getNextMonth();

      expect(nextMonth.month, equals(11));
    });

    test('getNextXMonth', () {
      final date = DateTime(2023, 10, 10);
      final next5thMonth = date.getNextXMonth(5);

      expect(next5thMonth.month, equals(3));
      expect(next5thMonth.year, equals(2024));
    });

    test('getPreviousXMonth', () {
      final date = DateTime(2023, 10, 10);
      final previous5thMonth = date.getPreviousXMonth(5);

      expect(previous5thMonth.month, equals(5));
      expect(previous5thMonth.year, equals(2023));
    });

    test('getPreviousMonth', () {
      final date = DateTime(2023, 10, 10);
      final previousMonth = date.getPreviousMonth();

      expect(previousMonth.month, equals(9));
    });

    test('getMonthInWord', () {
      final date = DateTime(2023, 10, 10);
      final monthInWord = date.getMonthInWord();

      expect(monthInWord, equals('October'));
    });

    test('getDaysOfTheMonthYear', () {
      final date = DateTime(2023, 10, 10);
      final daysOfTheMonth = date.getDaysOfTheMonthYear();

      expect(daysOfTheMonth.length, equals(31));
      expect(daysOfTheMonth.first.day, equals(1));
      expect(daysOfTheMonth.last.day, equals(31));
    });

    test('getWeekdaysOfTheMonthYear', () {
      final date = DateTime(2023, 10, 10);
      final weekdaysOfTheMonth = date.getWeekdaysOfTheMonthYear();

      expect(weekdaysOfTheMonth.length, equals(22));
      expect(weekdaysOfTheMonth.first.weekday, equals(DateTime.monday));
      expect(weekdaysOfTheMonth.last.weekday, equals(DateTime.tuesday));
    });

    test('isWeekend', () {
      final saturday = DateTime(2023, 10, 14);
      final sunday = DateTime(2023, 10, 15);
      final monday = DateTime(2023, 10, 16);

      expect(saturday.isWeekend(), isTrue);
      expect(sunday.isWeekend(), isTrue);
      expect(monday.isWeekend(), isFalse);
    });

    test('isWeekday', () {
      final saturday = DateTime(2023, 10, 14);
      final sunday = DateTime(2023, 10, 15);
      final monday = DateTime(2023, 10, 16);

      expect(saturday.isWeekday(), isFalse);
      expect(sunday.isWeekday(), isFalse);
      expect(monday.isWeekday(), isTrue);
    });
  });
}
