import 'letter.dart';
import 'word.dart';

class LevelData {
  late Word? word;
  late List<Letter>? availableLetters;
  late List<Letter>? usedLetters;

  LevelData({this.word, this.availableLetters, this.usedLetters});

  // Map toJson() => {
  //       'word': word,
  //       'availableLetters': availableLetters,
  //       'usedLetters': usedLetters,
  //     };

  Map toJson() {
    return {
      'word': word,
      'availableLetters': availableLetters ?? [],
      'usedLetters': usedLetters ?? [],
    };
  }

  factory LevelData.fromJson(Map<String, dynamic> json) {
    List<Letter> availableLetters = [];
    for (var i = 0; i < json['availableLetters'].length; ++i) {
      availableLetters
          .add(Letter(id: i, letter: json['availableLetters'][i]['letter']));
    }

    List<Letter> usedLetters = [];
    for (var i = 0; i < json['usedLetters'].length; ++i) {
      usedLetters.add(Letter(id: i, letter: json['usedLetters'][i]['letter']));
    }

    return LevelData(
      word: json['word'] as Word,
      availableLetters: availableLetters,
      usedLetters: usedLetters,
    );
  }

  @override
  String toString() {
    return '\nword: $word, \navailableLetters: $availableLetters, \nusedLetters: $usedLetters';
  }
}
