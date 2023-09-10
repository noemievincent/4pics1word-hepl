import 'word.dart';

class Words {
  List<Word> items = [];

  toJSONEncodable() {
    return items.map((word) {
      return word.toJSONEncodable();
    }).toList();
  }

  @override
  String toString() {
    return '\nitems: $items';
  }
}
