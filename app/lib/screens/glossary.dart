import 'package:flutter/material.dart';

import '/models/storages/guessed_words_storage.dart';
import '../models/word.dart';
import '../partials/glossary/alphabet_scroll_page.dart';
import '../partials/icons/setting_icon.dart';
import '../partials/topbar/money.dart';
import '../partials/topbar/topbar.dart';
import '../styles/constants.dart';
import 'word_detail.dart';

class Glossary extends StatefulWidget {
  const Glossary({super.key});

  @override
  State<Glossary> createState() => _GlossaryState();
}

class _GlossaryState extends State<Glossary> {
  final GuessedWordsStorage _guessedWords = GuessedWordsStorage();

  final List<Word> words = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDailyBackgroundColor,
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopBar(leftItem: SettingIcon(), rightItem: Money()),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kHorizontalSpacer),
                    child: Column(children: [
                      Column(children: [
                        const Text("Glossaire", style: kTitleStyle),
                        const SizedBox(height: kDefaultSize),
                        FutureBuilder(
                          future: _guessedWords.storage.ready,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }

                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              var items =
                                  _guessedWords.storage.getItem('guessedWords');

                              if (items != null) {
                                for (var item in items['items']) {
                                  Word wordItem = Word.fromJson(item);
                                  words.add(wordItem);
                                }
                              }

                              if (words.isNotEmpty) {
                                return SizedBox(
                                  height: MediaQuery.of(context).size.height,
                                  child: AlphabetScrollPage(
                                    onClickedItem: (item) {
                                      Navigator.push<void>(
                                        context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              WordDetail(word: item),
                                        ),
                                      );
                                    },
                                    items: words,
                                  ),
                                );
                              }
                              return const Column(
                                children: [
                                  SizedBox(height: 300),
                                  Center(
                                    child: Text("Vous n'avez deviné aucun mot",
                                        style: kEmptyGlossaryTextStyle),
                                  )
                                ],
                              );
                            }

                            return const Column(
                              children: [
                                SizedBox(height: 300),
                                Center(
                                  child: Text(
                                      "Impossible d’accéder au stockage",
                                      style: kEmptyGlossaryTextStyle),
                                )
                              ],
                            );
                          },
                        )
                      ]),
                    ]))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
