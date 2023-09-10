import 'word.dart';

class Words {
  List<Word> items = [];

  // toJSONEncodable() {
  //   return items.map((word) {
  //     return word.toJSONEncodable();
  //   }).toList();
  // }

  Map toJson() => {
        'items': items,
      };

  @override
  String toString() {
    return '\nitems: $items';
  }
}
