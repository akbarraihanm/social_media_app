import 'package:social_media_app/core/helper/datetime_formatter_helper.dart';

extension ConvertString on String {
  String toDayMonthYear() {
    if (isNotEmpty) {
      final splitData = split(".");
      splitData.removeLast();
      final joinData = splitData.join("").split("T").join(" ");
      if (joinData.isNotEmpty) {
        return DateTimeFormatterHelper.formatTime(
          dateFormat: "dd MMMM yyyy", dateTime: DateTime.parse(joinData),
        );
      }
    }
    return "Unable to format data";
  }
}