import 'package:app/models/todays_word.dart';
import 'package:app/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../models/storages/current_level_storage.dart';
import '../models/storages/guessed_words_storage.dart';
import '../models/storages/unguessed_words_storage.dart';
import '../models/word.dart';
import '../partials/buttons/main_button.dart';
import '../partials/buttons/small_button.dart';
import '../partials/challenge_card.dart';
import '../partials/icons/setting_icon.dart';
import '../partials/images/images_grid.dart';
import '../partials/level_infos.dart';
import '../partials/topbar/money.dart';
import '../partials/topbar/topbar.dart';
import 'levels/regular_level.dart';

class Home extends StatefulWidget {
  final List<Word> words;
  final TodaysWord todaysWord;
  const Home({required this.words, required this.todaysWord, super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GuessedWordsStorage guessedWords = GuessedWordsStorage();
  final UnguessedWordsStorage unguessedWords = UnguessedWordsStorage();
  final CurrentLevelStorage currentLevel = CurrentLevelStorage();

  late List<Word> words = [];
  late TodaysWord todaysWord;

  String? formattedDate;
  late Word word;
  late Word dailyWord;
  late int level = 1;

  @override
  void initState() {
    super.initState();
    words = widget.words;
    todaysWord = widget.todaysWord;

    initializeDateFormatting();
    getDate();
    // getLevelData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getDate() {
    var now = DateTime.now();
    var formatter = DateFormat.yMMMMd('fr');
    formattedDate = formatter.format(now);
  }

  getLevelData() {
    word = words.first;
  }

  Future<void> getData() async {
    var items = currentLevel.storage.getItem('currentLevel');

    if (items == null || items['word'] == null) {
      word = words.first;
      currentLevel.level.word = word;
      await currentLevel.saveToStorage();
    } else {
      word = items['word'];
    }
  }

  _removeGuessedWord() async {
    words.removeWhere((w) => w.id == word.id);

    print(words);
    // await unguessedWords.removeItem(word);
    // await guessedWords.addItem(word);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDefaultBackgroundColor,
      body: Column(children: [
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopBar(leftItem: SettingIcon(), rightItem: Money()),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kHorizontalSpacer),
                child: Column(
                  children: [
                    FutureBuilder(
                      future: getData(),
                      builder: (context, snapshot) {
                        return Column(
                          children: [
                            Stack(
                              alignment: Alignment.topCenter,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: kDefaultSize * 4),
                                  child: ImagesGrid(images: word.images),
                                ),
                                LevelInfos(
                                    label: "Niveau $level",
                                    color: kDefaultMainColor)
                              ],
                            ),
                            const SizedBox(height: kDefaultSize * 3),
                            MainButton(
                                label: 'Jouer',
                                style: kPlayButton,
                                color: kCTAColor,
                                onPressed: () {
                                  Navigator.push<void>(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          RegularLevel(
                                              title: "Niveau $level",
                                              word: word,
                                              color: kDefaultMainColor,
                                              removeGuessedWord:
                                                  _removeGuessedWord),
                                    ),
                                  ).then((value) => setState(() {
                                        getLevelData();
                                      }));
                                }),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: kDefaultSize * 5),
                    ChallengeCard(
                        title:
                            Text(formattedDate.toString(), style: kDateStyle),
                        middleElement: const Text(
                          "Devinez un nouveau mot et gagnez chaque jour un bonus !",
                          style: kDailyTaglineStyle,
                          textAlign: TextAlign.center,
                        ),
                        button: MainButton(
                            label: "Mot du jour",
                            style: kDailyWordButtonStyle,
                            color: kDailyMainColor,
                            onPressed: () {
                              // TODO: Navigate to DailyLevel
                              // Navigator.push<void>(
                              //   context,
                              //   MaterialPageRoute<void>(
                              //     builder: (BuildContext context) =>
                              //         DailyLevel(
                              //             title:
                              //                 formattedDate.toString(),
                              //             word: dailyWord,
                              //             color: kDailyMainColor,
                              //             removeGuessedWord:
                              //                 _removeGuessedWord),
                              //   ),
                              // );
                            }),
                        withGap: true),
                    const SizedBox(height: kDefaultSize * 5),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ChallengeCard(
                                title: const Text("Timer",
                                    style: kTimerTitleStyle),
                                middleElement: SvgPicture.asset(
                                    'assets/icons/challenges/timer.svg',
                                    color: kTimerMainColor,
                                    width: kDefaultSize * 25),
                                button: SmallButton(
                                    label: "Jouer",
                                    style: kChallengesButtonStyle,
                                    color: kTimerMainColor,
                                    onPressed: () {
                                      // TODO: Navigate to TimerLevel
                                      // Navigator.push<void>(
                                      //   context,
                                      //   MaterialPageRoute<void>(
                                      //     builder: (BuildContext context) =>
                                      //         TimerLevel(
                                      //             title: "00:00",
                                      //             word: word,
                                      //             color: kTimerMainColor,
                                      //             removeGuessedWord:
                                      //                 _removeGuessedWord),
                                      //   ),
                                      // );
                                    })),
                          ),
                          const SizedBox(width: kDefaultSize * 5),
                          Expanded(
                              child: ChallengeCard(
                                  title: const Text("Moins d'images",
                                      style: kLessImageTitleStyle,
                                      textAlign: TextAlign.center),
                                  middleElement: SvgPicture.asset(
                                      'assets/icons/challenges/less-images.svg',
                                      color: kLessImageMainColor,
                                      width: kDefaultSize * 25),
                                  button: SmallButton(
                                      label: "Jouer",
                                      style: kChallengesButtonStyle,
                                      color: kLessImageMainColor,
                                      onPressed: () {
                                        // TODO: Navigate to LessImageLevel
                                        // Navigator.push<void>(
                                        //   context,
                                        //   MaterialPageRoute<void>(
                                        //     builder: (BuildContext context) =>
                                        //         LessImageLevel(
                                        //             title: "Moins d'images",
                                        //             word: word,
                                        //             color: kLessImageMainColor,
                                        //             removeGuessedWord:
                                        //                 _removeGuessedWord),
                                        //   ),
                                        // );
                                      }))),
                        ],
                      ),
                    ),
                    const SizedBox(height: kDefaultSize * 30),
                  ],
                ),
              )
            ],
          ),
        ))
      ]),
    );
  }
}
