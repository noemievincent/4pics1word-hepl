import 'package:app/styles/constants.dart';
import 'package:flutter/material.dart';

import '../models/word.dart';
import '../partials/small_images.dart';

class WordData extends StatefulWidget {
  final Word word;
  final int index;
  final Function? removeGuessedWord;
  const WordData(
      {required this.word,
      required this.index,
      this.removeGuessedWord,
      super.key});

  @override
  State<WordData> createState() => _WordDataState();
}

class _WordDataState extends State<WordData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.index % 2 == 0 ? Colors.pink[50] : Colors.orange[50],
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {
                  widget.removeGuessedWord!(widget.word);
                },
                child: Text(widget.word.word, style: kGlossaryWordStyle)),
            const SizedBox(height: 2),
            Text(
              widget.word.category,
            ),
            const SizedBox(height: 12),
            SmallImage(path: widget.word.previewImage),
          ],
        ),
      ),
    );
  }
}
