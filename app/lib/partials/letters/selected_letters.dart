import 'package:flutter/material.dart';
import '../../models/letter.dart';

class SelectedLetters extends StatefulWidget {
  final List<Letter> usedLetters;
  final Color color;
  final List<String> correctLetters;

  const SelectedLetters({required this.usedLetters, required this.color, Key? key, required this.correctLetters}) : super(key: key);

  @override
  State<SelectedLetters> createState() => _SelectedLettersState();
}

class _SelectedLettersState extends State<SelectedLetters> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < widget.correctLetters.length; ++i) ...[
          if (i > 0) ...[
            const SizedBox(width: 2),
          ],
          // SelectedLetterCard(letter: widget.usedLetters.isNotEmpty ? (i < widget.usedLetters.length ? widget.usedLetters[i] : "") : "", color: widget.color),
          if (i < 9) ...[
            const SizedBox(width: 2),
          ],
        ],
      ],
    );
  }
}
