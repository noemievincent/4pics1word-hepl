import 'dart:math';

import 'package:app/partials/buttons/main_button.dart';
import 'package:app/partials/icons/back_arrow_icon.dart';
import 'package:app/partials/images/images_grid.dart';
import 'package:app/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/letter.dart';
import '../../models/storages/current_level_storage.dart';
import '../../models/storages/guessed_words_storage.dart';
import '../../models/storages/unguessed_words_storage.dart';
import '../../models/word.dart';
import '../../partials/hints/hint.dart';
import '../../partials/letters/available_letter_card.dart';
import '../../partials/letters/selected_letter_card.dart';
import '../../partials/topbar/money.dart';
import '../../partials/topbar/topbar.dart';

class RegularLevel extends StatefulWidget {
  final String title;
  final Word word;
  final Color color;
  final Function? removeGuessedWord;

  const RegularLevel(
      {required this.title,
      required this.word,
      required this.color,
      this.removeGuessedWord,
      Key? key})
      : super(key: key);

  @override
  State<RegularLevel> createState() => _RegularLevelState();
}

class _RegularLevelState extends State<RegularLevel>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;

  late OverlayEntry overlayEntry;

  void _showOverlay(BuildContext context, {required Widget child}) async {
    OverlayState? overlayState = Overlay.of(context);
    overlayEntry = OverlayEntry(builder: (context) {
      return child;
    });
    animationController!.addListener(() {
      overlayState!.setState(() {});
    });
    // inserting overlay entry
    await Future.delayed(const Duration(milliseconds: 200))
        .whenComplete(() => overlayState!.insert(overlayEntry));

    animationController!.forward();
  }

  dynamic _closeOverlay() async {
    animationController!.reverse();
    overlayEntry.remove();
  }

  final List<Letter> availableLetters = [];
  final List<Letter> usedLetters = [];

  final GuessedWordsStorage guessedWords = GuessedWordsStorage();
  final UnguessedWordsStorage unguessedWords = UnguessedWordsStorage();
  final CurrentLevelStorage currentLevel = CurrentLevelStorage();

  List<String> alphabets = [
    for (var i = 65; i <= 90; i++) String.fromCharCode(i)
  ];

  generateAvailableLetters() async {
    for (var letter in widget.word.letters) {
      availableLetters.add(letter);
    }

    for (var i = widget.word.letters.length; i < 12; ++i) {
      availableLetters.add(
          Letter(id: i, letter: alphabets[Random().nextInt(alphabets.length)]));
    }

    availableLetters.shuffle();
  }

  late Word nextWord;

  late int _id;
  late String _guessedWord = "";
  late Color _letterCardColor = widget.color;

  @override
  initState() {
    // TODO: NOTHING IS WORKING
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation =
        CurveTween(curve: Curves.fastOutSlowIn).animate(animationController!);

    // getLevelData();
  }

  getNextWord() {
    var item = (unguessedWords.storage.getItem('unguessedWords') as List)[1];
    nextWord = Word.fromJson(item);
  }

  Future<void> getLevelData() async {
    var items = currentLevel.storage.getItem('currentLevel');

    if (items['availableLetters'].isNotEmpty) {
      for (var item in items['availableLetters']) {
        Letter letter = Letter.fromJson(item);
        availableLetters.add(letter);
      }
    } else {
      generateAvailableLetters();
    }

    if (items['usedLetters'].isNotEmpty) {
      for (var item in items['usedLetters']) {
        Letter letter = Letter.fromJson(item);
        usedLetters.add(letter);
      }
    }

    currentLevel.level.word = widget.word;
    currentLevel.level.availableLetters = availableLetters;
    currentLevel.level.usedLetters = usedLetters;

    await currentLevel.saveToStorage();
  }

  _removeGuessedWord() async {
    // var items = unguessedWords.storage.getItem('unguessedWords');

    // List<Word> words = [];

    // if (items != null) {
    //   for (var item in items) {
    //     Word wordItem = Word.fromJson(item);
    //     words.add(wordItem);
    //   }
    // }
    // words.removeAt(0);
    // unguessedWords.words.items = words;
    // await unguessedWords.saveToStorage();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //forbidden swipe in iOS(my ThemeData(platform: TargetPlatform.iOS,)
      onWillPop: () async {
        if (Navigator.of(context).userGestureInProgress) {
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: kDefaultBackgroundColor,
        body: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopBar(
                      leftItem: const BackArrowIcon(),
                      title: widget.title,
                      rightItem: const Money(),
                      backgroundColor: kDefaultMainColor),
                  const SizedBox(height: kDefaultSize * 3),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: kHorizontalSpacer),
                    child: FutureBuilder(
                        future: getLevelData(),
                        builder: (context, snapshot) {
                          return Column(
                            children: [
                              ImagesGrid(
                                images: widget.word.images,
                                isInteractive: true,
                              ),
                              const SizedBox(height: kDefaultSize * 6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  for (var i = 0;
                                      i < widget.word.letters.length;
                                      i++) ...[
                                    if (i > 0) ...[
                                      const SizedBox(width: 2),
                                    ],
                                    GestureDetector(
                                      onTap: () {
                                        print('remove letter');
                                      },
                                      child: SelectedLetterCard(
                                          letter: usedLetters.isNotEmpty
                                              ? (i < usedLetters.length
                                                  ? usedLetters[i]
                                                  : null)
                                              : null,
                                          color: _letterCardColor),
                                    ),
                                    if (i < 9) ...[
                                      const SizedBox(width: 2),
                                    ],
                                  ]
                                ],
                              ),
                              const SizedBox(height: kDefaultSize * 6),
                              Wrap(
                                runSpacing: kDefaultSize * 2,
                                spacing: kDefaultSize * 2,
                                children: [
                                  for (var letter in availableLetters) ...[
                                    GestureDetector(
                                      onTap: () {
                                        print(letter);
                                        setState(() {
                                          if (!letter.isUsed) {}
                                        });
                                      },
                                      child: AvailableLetterCard(
                                          letter: letter.letter,
                                          isUsed: letter.isUsed),
                                    )
                                  ],
                                ],
                              ),
                              const SizedBox(height: kDefaultSize * 4),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    for (var i = 0; i < 4; ++i) ...[
                                      const Hint(
                                          icon:
                                              'assets/icons/hints/add-image.svg'),
                                    ],
                                  ]),
                              const SizedBox(height: kDefaultSize * 3),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(
                                      width: 300,
                                      child: MainButton(
                                          label: "Demander à un ami",
                                          style: kAskAFriendButtonStyle,
                                          color: kCTAColor),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          availableLetters.shuffle();
                                        });
                                      },
                                      child: Container(
                                        width: 52,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: kLettersBackgroundColor,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(kBorderRadiusSmall),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: darken(
                                                  kLettersBackgroundColor, .1),
                                              offset: const Offset(0, 2),
                                            )
                                          ],
                                        ),
                                        transformAlignment: Alignment.center,
                                        child: Center(
                                            child: SvgPicture.asset(
                                                'assets/icons/hints/shuffle.svg')),
                                      ),
                                    )
                                  ]),
                            ],
                          );
                        }),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
