import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'models/storages/current_level_storage.dart';
import 'models/storages/daily_words_storage.dart';
import 'models/storages/guessed_words_storage.dart';
import 'models/storages/unguessed_words_storage.dart';
import 'models/todays_word.dart';
import 'models/word.dart';
import 'partials/navbar.dart';
import 'routes/router.dart';
import 'screens/daily.dart';
import 'screens/error.dart';
import 'screens/glossary.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

CollectionReference _wordsCollection =
    FirebaseFirestore.instance.collection('words');
CollectionReference _dailyWordCollection =
    FirebaseFirestore.instance.collection('dailyWords');

final UnguessedWordsStorage _unguessedWords = UnguessedWordsStorage();
final GuessedWordsStorage _guessedWords = GuessedWordsStorage();
final DailyWordsStorage _dailyWords = DailyWordsStorage();
final CurrentLevelStorage _currentLevel = CurrentLevelStorage();

List<Word> _words = [];
late TodaysWord _todaysWord;

var _now = DateTime.now();
DateFormat formatter = DateFormat("dd-MM-yyyy");
String formattedDate = formatter.format(_now);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _handleGuessedWord(Word word) async {
    _guessedWords.addItem(word);
    _unguessedWords.removeItem(word);
  }

  Future<void> setupData() async {
    initializeDateFormatting();

    // await resetStorages();
    await Firebase.initializeApp(); //* Initialize Firebase

    addWordsToFirestore(all: false);

    var items = _unguessedWords.storage.getItem('unguessedWords');

    if (items == null) {
      print('Storage was empty');
      _words =
          await getWordsFromFirestore(); //* Fetch and assign words data from Firestore
    } else {
      print('Storage was not empty');
      for (var item in items['items']) {
        var word = Word.fromJson(item);
        _words.add(word);
      }
    }

    _todaysWord = await getDailyWordsFromFirestore();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _unguessedWords.storage.ready,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return FutureBuilder(
              future: setupData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  return MaterialApp(
                    title: '4 Images 1 Mot',
                    home: const MainPage(),
                    routes: router,
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(fontFamily: 'Montserrat'),
                  );
                }

                return const ErrorScreen(
                  title: 'There seems to be a connection problem',
                );
              });
        }
        return const ErrorScreen(
          title: 'Could not access storage',
        );
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final List<Widget> _pages = [
    Home(
        key: const PageStorageKey("Home"),
        words: _words,
        todaysWord: _todaysWord),
    Daily(key: const PageStorageKey("Daily"), todaysWord: _todaysWord),
    const Glossary(
      key: PageStorageKey("Glossary"),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: _pages[_selectedIndex],
      ),
      extendBody: true,
      bottomNavigationBar: NavBar(index: _selectedIndex, onTapped: _onTapped),
    );
  }
}

//* Reset storages while in developement mode for testing purposes
Future<void> resetStorages() async {
  _unguessedWords.clearStorage();
  _guessedWords.clearStorage();
  _dailyWords.clearStorage();
  print('Storages have been reset');
}

//* Retrieve words from the Firestore collection.
Future<List<Word>> getWordsFromFirestore() async {
  final List<Word> fetchedWords = [];
  await _wordsCollection.get().then((datas) async {
    if (datas.docs.isNotEmpty) {
      print('Data fetched with success!');
      fetchedWords.addAll(await parseWords(datas.docs));
      return fetchedWords;
    } else {
      print("No data found");
    }
  });
  return fetchedWords;
}

Future<List<Word>> parseWords(datas) async {
  final List<Word> parsedWords = [];
  for (var data in datas) {
    Word word = Word.fromFirestore(data);
    parsedWords.add(word);
    _unguessedWords.words.items.add(word);
  }
  await _unguessedWords.saveToStorage();
  return parsedWords;
}

Future<TodaysWord> getDailyWordsFromFirestore() async {
  late TodaysWord fetchedWord;
  await _dailyWordCollection.get().then((datas) async {
    if (datas.docs.isNotEmpty) {
      print('Data fetched with success!');
      fetchedWord = await parseDailyWords(datas.docs);
      return fetchedWord;
    } else {
      print("No data found");
    }
  });
  return fetchedWord;
}

Future<TodaysWord> parseDailyWords(datas) async {
  late TodaysWord parsedWord;

  for (var data in datas) {
    TodaysWord word = TodaysWord.fromFirestore(data);

    _dailyWords.words.items.add(word);

    if (word.date == formattedDate) {
      _dailyWords.currentDayWord = word;
      parsedWord = word;
    }
  }

  await _dailyWords.saveToStorage();
  return parsedWord;
}

//* Fill the Firestore collections
Future<void> addWordsToFirestore({bool all = false}) async {
  List wordsData = [];

  final String response =
      await rootBundle.loadString('assets/sources/words.json');
  final data = await json.decode(response);
  wordsData = data["words"];

  //* Fill words collection with all the words if needed
  if (all) {
    for (var word in wordsData) {
      _wordsCollection
          .doc(word['word'])
          .set({
            'word': word['word'],
            'category': word['category'],
            'previewImage': word['previewImage'],
            'images': word['images'],
            'definitions': word['definitions'],
            'letters': word['letters']
          })
          .then((value) => print("Word Added"))
          .catchError((error) => print("Failed to add word: $error"));
    }
  }

  //* Add a new daily word if it doesn't exist already
  _dailyWordCollection.doc(formattedDate).get().then((data) async {
    if (data.data() == null) {
      final int randomIndex = Random().nextInt(_words.length);
      var dailyWord = _words[randomIndex];
      await addDailyWordToFireStore(dailyWord, formattedDate);
    }
  });
}

Future<void> addDailyWordToFireStore(Word dailyWord, String date) async {
  _dailyWordCollection
      .doc(date)
      .set({
        'date': date,
        'word': dailyWord.word,
        'category': dailyWord.category,
        'previewImage': dailyWord.previewImage,
        'images': dailyWord.images,
        'definitions': dailyWord.definitions,
        'letters': dailyWord.letters.map((letter) {
          return letter.toJson();
        })
      })
      .then((value) => print("Daily Word Added"))
      .catchError((error) => print("Failed to add word: $error"));
}
