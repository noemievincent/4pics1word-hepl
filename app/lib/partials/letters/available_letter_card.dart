import 'package:flutter/material.dart';
import '../../styles/constants.dart';

class AvailableLetterCard extends StatelessWidget {
  final String letter;
  final bool isUsed;

  const AvailableLetterCard({required this.letter, required this.isUsed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 50,
      decoration: BoxDecoration(
        color: isUsed ? kUsedLettersBackgroundColor : kLettersBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(kBorderRadiusSmall),
        ),
        boxShadow: [
          BoxShadow(
            color: isUsed ? kUsedLettersBackgroundColor : darken(kLettersBackgroundColor, .1),
            offset: const Offset(0, 2),
          )
        ],
      ),
      transformAlignment: Alignment.center,
      child: isUsed ? null : Center(
          child: Text(letter, style: kAvailableLettersStyle)
      ),
    );
  }
}
