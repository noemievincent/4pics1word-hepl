import 'package:cloud_firestore/cloud_firestore.dart';

import 'letter.dart';

class Word {
  final String? id;
  final String word;
  final String category;
  final String previewImage;
  final List<String> images;
  final List<String> definitions;
  final List<Letter> letters;

  Word({
    this.id,
    required this.word,
    required this.category,
    required this.previewImage,
    required this.images,
    required this.definitions,
    required this.letters,
  });

  toJSONEncodable() {
    Map<String, dynamic> item = {};

    item['id'] = id;
    item['word'] = word;
    item['category'] = category;
    item['previewImage'] = previewImage;
    item['images'] = images;
    item['definitions'] = definitions;
    item['letters'] = letters.map((letter) {
      return letter.toJSONEncodable();
    }).toList();

    return item;
  }

  factory Word.fromJson(Map<String, dynamic> json) {
    List<String> images = [];
    for (var image in json['images']) {
      images.add(image);
    }

    List<String> definitions = [];
    for (var definition in json['definitions']) {
      definitions.add(definition);
    }

    List<Letter> letters = [];
    for (var i = 0; i < json['letters'].length; ++i) {
      letters.add(Letter(id: i, letter: json['letters'][i]['letter']));
    }

    return Word(
      id: json['id'] as String,
      word: json['word'] as String,
      category: json['category'] as String,
      previewImage: json['previewImage'] as String,
      images: images,
      definitions: definitions,
      letters: letters,
    );
  }

  factory Word.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    List<String> images = [];
    for (var image in data['images']) {
      images.add(image);
    }

    List<String> definitions = [];
    for (var definition in data['definitions']) {
      definitions.add(definition);
    }

    List<Letter> letters = [];
    for (var i = 0; i < data['letters'].length; ++i) {
      letters.add(Letter(id: i, letter: data['letters'][i]['letter']));
    }

    return Word(
      id: doc.id,
      word: data['word'] ?? '',
      category: data['category'] ?? '',
      previewImage: data['previewImage'] ?? '',
      images: images,
      definitions: definitions,
      letters: letters,
    );
  }

  @override
  String toString() {
    return '\nid: $id, \nword: $word, \ncategory: $category, \nimages: $images, \ndefinitions: $definitions, \nletters: $letters';
  }
}
