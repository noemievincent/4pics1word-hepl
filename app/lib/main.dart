import 'dart:convert';
import 'dart:math';

import 'package:app/screens/words_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/word.dart';
import 'routes/router.dart';
import 'screens/error.dart';

void main() {
  runApp(const MyApp());
}

List<Word> _words = [];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: setupData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (_words.isEmpty) {
            return const ErrorScreen(
              title: 'No words found',
            );
          }
          return MaterialApp(
            title: '4 Images 1 Mot',
            home: WordsList(words: _words),
            routes: router,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'Montserrat'),
          );
        }
        return const ErrorScreen(
          title: 'There seems to be a connection problem',
        );
      },
    );
  }

  Future<void> setupData() async {
    await Firebase.initializeApp(); //* Initialize Firebase
    _words =
        await getWordsFromFirestore(); //* Fetch and assign words data from Firestore
  }
}

//* Retrieve words from the Firestore collection.
Future<List<Word>> getWordsFromFirestore() async {
  final List<Word> fetchedWords = [];
  await FirebaseFirestore.instance
      .collection('words')
      .get()
      .then((datas) async {
    if (datas.docs.isNotEmpty) {
      print('Data fetched with success!');
      fetchedWords.addAll(parseWords(datas.docs));
      return fetchedWords;
    } else {
      print("No data found");
    }
  });
  return fetchedWords;
}

List<Word> parseWords(datas) {
  final List<Word> parsedWords = [];
  for (var data in datas) {
    Word word = Word.fromFirestore(data);
    parsedWords.add(word);
  }
  return parsedWords;
}

//* Run only once to fill the Firestore collections
Future<void> addWordsToFirestore() async {
  List wordsData = [];
  CollectionReference wordsCollection =
      FirebaseFirestore.instance.collection('words');
  CollectionReference dailyWordCollection =
      FirebaseFirestore.instance.collection('dailyWord');

  final String response =
      await rootBundle.loadString('assets/sources/words.json');
  final data = await json.decode(response);
  wordsData = data["words"];

  for (var word in wordsData) {
    wordsCollection
        .doc(wordsData.indexOf(word).toString())
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

  var dailyWord = wordsData[Random().nextInt(wordsData.length)];
  DateTime now = DateTime.now();
  DateTime date = DateTime(now.year, now.month, now.day);

  dailyWordCollection
      .doc(wordsData.indexOf(dailyWord).toString())
      .set({
        'date': date,
        'word': dailyWord['word'],
        'category': dailyWord['category'],
        'previewImage': dailyWord['previewImage'],
        'images': dailyWord['images'],
        'definitions': dailyWord['definitions'],
        'letters': dailyWord['letters']
      })
      .then((value) => print("Daily Word Added"))
      .catchError((error) => print("Failed to add word: $error"));
}
