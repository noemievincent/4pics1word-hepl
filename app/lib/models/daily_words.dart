import 'todays_word.dart';

class DailyWords {
  List<TodaysWord> items = [];

  Map toJson() => {
        'items': items,
      };

  @override
  String toString() {
    return '\nitems: $items';
  }
}
