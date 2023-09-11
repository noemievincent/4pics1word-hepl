import 'package:flutter/material.dart';
import '../../styles/constants.dart';

class AvailableLetters extends StatelessWidget {
  final List<String> letters;

  const AvailableLetters({Key? key, required this.letters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: kDefaultSize * 2,
      spacing: kDefaultSize * 2,
      children: const [
        // for (var i = 0; i < letters.length; ++i) ...[
        //   AvailableLetterCard(
        //       letter: letters[i], isUsed: false),
        // ],
      ],
    );
  }
}
