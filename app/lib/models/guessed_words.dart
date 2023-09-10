import 'package:localstorage/localstorage.dart';

import 'word.dart';
import 'words.dart';

class GuessedWords {
  final LocalStorage storage = LocalStorage('guessedWords.json');
  final Words words = Words();

  saveToStorage() async {
    await storage.setItem('guessedWords', words);
    print('Storage saved !');
  }

  addItem(Word word) async {
    words.items.add(word);
    print('${word.word} added !');
    await saveToStorage();
  }

  clearStorage() async {
    await storage.clear();
    words.items = storage.getItem('guessedWords') ?? [];
  }
}
