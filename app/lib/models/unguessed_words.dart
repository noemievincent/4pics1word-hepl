import 'package:localstorage/localstorage.dart';

import 'word.dart';
import 'words.dart';

class UnguessedWords {
  final LocalStorage storage = LocalStorage('unguessedWords.json');
  final Words words = Words();

  saveToStorage() async {
    await storage.setItem('unguessedWords', words);
    print('Storage saved !');
  }

  removeItem(Word word) async {
    words.items.removeWhere((tempWord) => tempWord.id == word.id);
    print('${word.word} removed !');
    await saveToStorage();
  }

  clearStorage() async {
    await storage.clear();
    words.items = storage.getItem('unguessedWords') ?? [];
  }
}
