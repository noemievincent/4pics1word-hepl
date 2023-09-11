import 'package:cloud_firestore/cloud_firestore.dart';

import 'letter.dart';
import 'word.dart';

class TodaysWord extends Word {
  final String date;

  TodaysWord({
    String? id,
    required this.date,
    required String word,
    required String category,
    required String previewImage,
    required List<String> images,
    required List<String> definitions,
    required List<Letter> letters,
  }) : super(
          id: id,
          word: word,
          category: category,
          previewImage: previewImage,
          images: images,
          definitions: definitions,
          letters: letters,
        );

  Map toJson() => {
        'id': id,
        'date': date,
        'word': word,
        'category': category,
        'previewImage': previewImage,
        'images': images,
        'definitions': definitions,
        'letters': letters,
      };

  factory TodaysWord.fromJson(Map<String, dynamic> json) {
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

    return TodaysWord(
      id: json['id'] as String,
      date: json['date'] as String,
      word: json['word'] as String,
      category: json['category'] as String,
      previewImage: json['previewImage'] as String,
      images: images,
      definitions: definitions,
      letters: letters,
    );
  }

  factory TodaysWord.fromFirestore(DocumentSnapshot doc) {
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

    return TodaysWord(
      id: doc.id,
      date: data['date'] ?? '',
      word: data['word'] ?? '',
      category: data['category'] ?? '',
      previewImage: data['previewImage'] ?? '',
      images: images,
      definitions: definitions,
      letters: letters,
    );
  }
}
