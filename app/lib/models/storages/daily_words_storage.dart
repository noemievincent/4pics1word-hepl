import 'package:localstorage/localstorage.dart';

import '/models/daily_words.dart';
import '/models/todays_word.dart';

class DailyWordsStorage {
  final LocalStorage storage = LocalStorage('dailyWords.json');
  late DailyWords words = DailyWords();
  late TodaysWord currentDayWord;

  saveToStorage() async {
    await storage.setItem('dailyWords', words);
    await storage.setItem('currentDayWord', currentDayWord);
    print('Daily words storage saved !');
  }

  addItem(TodaysWord word) async {
    words.items.add(word);
    print('${word.word} added !');
    await saveToStorage();
  }

  clearStorage() async {
    await storage.clear();
    words.items = storage.getItem('dailyWords') ?? [];
  }

  setCurrentDayWord(TodaysWord word) async {
    currentDayWord = word;
  }
}
