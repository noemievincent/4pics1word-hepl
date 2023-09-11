import 'package:localstorage/localstorage.dart';

import '../level_data.dart';

class CurrentLevelStorage {
  final LocalStorage storage = LocalStorage('currentLevel.json');
  late LevelData level = LevelData();

  saveToStorage() async {
    await storage.setItem('currentLevel', level);
    print('Current Level storage saved !');
  }

  addItem(LevelData data) async {
    level = LevelData(
        word: data.word,
        availableLetters: data.availableLetters,
        usedLetters: data.usedLetters);
    await saveToStorage();
  }

  clearStorage() async {
    await storage.clear();
    level = storage.getItem('currentLevel');
  }
}
