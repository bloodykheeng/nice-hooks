class MyDateUtils {
  static DateTime todayMinusDays(int num) => DateTime.now().subtract(
        Duration(
            days: num,
            hours: DateTime.now().hour,
            minutes: DateTime.now().minute,
            seconds: DateTime.now().second),
      );
}
