import 'package:app/partials/buttons/main_button.dart';
import 'package:flutter/material.dart';

import '../../models/word.dart';
import '../../partials/buttons/link.dart';
import '../../partials/images/small_image.dart';
import '../../partials/letters/selected_letter_card.dart';
import '../../styles/constants.dart';
import '../levels/regular_level.dart';
import '../word_detail.dart';

class Success extends StatefulWidget {
  final Word word;
  final Word nextWord;
  final Function closeOverlay;

  const Success(
      {required this.word,
      required this.nextWord,
      required this.closeOverlay,
      Key? key})
      : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Scaffold(
        backgroundColor: kOverlayBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(
              top: kDefaultSize * 36, bottom: kDefaultSize * 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Parfait !',
                style: kSuccessTitleStyle,
              ),
              const SizedBox(height: kDefaultSize * 16),
              SmallImage(path: widget.word.previewImage),
              const SizedBox(height: kDefaultSize * 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < widget.word.letters.length; ++i) ...[
                    if (i > 0) ...[
                      const SizedBox(width: 2),
                    ],
                    SelectedLetterCard(
                        letter: widget.word.letters[i],
                        color: kDefaultMainColor),
                    if (i < 9) ...[
                      const SizedBox(width: 2),
                    ],
                  ],
                ],
              ),
              const SizedBox(height: kDefaultSize * 20),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kHorizontalSpacer * 4),
                    child: MainButton(
                        label: 'Suivant',
                        style: kPlayButton,
                        color: kCTAColor,
                        onPressed: () {
                          widget.closeOverlay();
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) => RegularLevel(
                                    title: "Niveau",
                                    word: widget.nextWord,
                                    color: kDefaultMainColor)),
                          );
                        }),
                  ),
                  const SizedBox(height: kDefaultSize * 8),
                  Link(
                      text: "Voir la fiche du mot",
                      style: kSubtileStyle,
                      onTap: () {
                        widget.closeOverlay();
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                WordDetail(word: widget.word),
                          ),
                        );
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
