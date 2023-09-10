import 'package:app/screens/word_data.dart';
import 'package:flutter/material.dart';

import '../models/word.dart';

class WordsList extends StatefulWidget {
  final List<Word> words;
  final Function? removeGuessedWord;
  const WordsList({required this.words, this.removeGuessedWord, Key? key})
      : super(key: key);

  @override
  State<WordsList> createState() => _WordsListState();
}

class _WordsListState extends State<WordsList> {
  removeGuessedWord(Word word) {
    print('${word.word} has been guessed!');
    widget.removeGuessedWord!(word);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemCount: widget.words.length,
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
                height: 10,
              ),
          itemBuilder: (context, index) {
            return WordData(
              word: widget.words[index],
              index: index,
              removeGuessedWord: removeGuessedWord,
            );
          }),
    );
  }
}
