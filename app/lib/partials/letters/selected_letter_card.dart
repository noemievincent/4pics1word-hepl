import 'package:flutter/material.dart';

import '../../models/letter.dart';
import '../../styles/constants.dart';

class SelectedLetterCard extends StatelessWidget {
  final Letter? letter;
  final Color color;

  const SelectedLetterCard({this.letter, required this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 34,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(kBorderRadiusSmall),
        ),
        boxShadow: [
          BoxShadow(
            color: darken(color, .1),
            offset: const Offset(0, 2),
          )
        ],
      ),
      transformAlignment: Alignment.center,
      child: letter != null ? Center(
        child: Text(letter?.letter != null ? letter!.letter : "", style: kSelectedLettersStyle)
      ) : null,
    );
  }
}
