import 'word.dart';

class Words {
  List<Word> items = [];

  Map toJson() => {
        'items': items,
      };

  @override
  String toString() {
    return '\nitems: $items';
  }
}
