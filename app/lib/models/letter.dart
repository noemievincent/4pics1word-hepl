class Letter {
  final int id;
  final String letter;
  late bool isUsed;
  late int position;

  Letter(
      {required this.id,
      required this.letter,
      this.isUsed = false,
      this.position = 0});

  toJSONEncodable() {
    Map<String, dynamic> item = {};

    item['id'] = id;
    item['letter'] = letter;
    item['isUsed'] = isUsed;
    item['position'] = position;

    return item;
  }

  factory Letter.fromJson(Map<String, dynamic> json) {
    return Letter(
      id: json['id'] as int,
      letter: json['letter'] as String,
      isUsed: json['isUsed'] as bool,
      position: json['position'] as int,
    );
  }

  @override
  String toString() {
    return '\nid: $id, letter: $letter, isUsed: $isUsed, \n position: $position';
  }
}
