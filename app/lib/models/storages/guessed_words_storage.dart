import 'package:localstorage/localstorage.dart';

import '/models/word.dart';
import '/models/words.dart';

class GuessedWordsStorage {
  final LocalStorage storage = LocalStorage('guessedWords.json');
  final Words words = Words();

  saveToStorage() async {
    await storage.setItem('guessedWords', words);
    print('Guessed Words storage saved !');
  }

  addItem(Word word) async {
    words.items.add(word);
    print('${word.word} added to guessed words!');
    await saveToStorage();
  }

  clearStorage() async {
    await storage.clear();
    words.items = storage.getItem('guessedWords') ?? [];
  }
}
