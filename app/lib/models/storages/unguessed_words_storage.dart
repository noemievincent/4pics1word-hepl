import 'package:localstorage/localstorage.dart';

import '/models/word.dart';
import '/models/words.dart';

class UnguessedWordsStorage {
  final LocalStorage storage = LocalStorage('unguessedWords.json');
  final Words words = Words();

  saveToStorage() async {
    await storage.setItem('unguessedWords', words);
    print('Unguessed Words storage saved !');
  }

  removeItem(Word word) async {
    words.items.removeWhere((w) => w.id == word.id);
    print('${word.word} removed from unguessed words!');
    await saveToStorage();
  }

  clearStorage() async {
    await storage.clear();
    words.items = storage.getItem('unguessedWords') ?? [];
  }
}
