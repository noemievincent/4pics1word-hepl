import 'package:app/partials/small_images.dart';
import 'package:app/styles/constants.dart';
import 'package:flutter/material.dart';

import '../models/word.dart';

class WordData extends StatelessWidget {
  final Word word;
  const WordData({required this.word, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(word.word, style: kGlossaryWordStyle),
        const SizedBox(height: 2),
        Text(
          word.category,
        ),
        const SizedBox(height: 12),
        SmallImage(path: word.previewImage),
      ],
    );
  }
}
