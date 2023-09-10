import 'package:app/screens/word_data.dart';
import 'package:flutter/material.dart';

import '../models/word.dart';

class WordsList extends StatefulWidget {
  final List<Word> words;
  const WordsList({required this.words, Key? key}) : super(key: key);

  @override
  State<WordsList> createState() => _WordsListState();
}

class _WordsListState extends State<WordsList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
            itemCount: widget.words.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
                  color: Colors.black,
                  height: 40,
                ),
            itemBuilder: (context, index) {
              return WordData(word: widget.words[index]);
            }),
      ),
    );
  }
}
