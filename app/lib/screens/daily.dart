import 'package:app/partials/buttons/main_button.dart';
import 'package:app/partials/images/images_grid.dart';
import 'package:app/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '/models/todays_word.dart';
import '../partials/icons/setting_icon.dart';
import '../partials/level_infos.dart';
import '../partials/topbar/money.dart';
import '../partials/topbar/topbar.dart';

class Daily extends StatefulWidget {
  final TodaysWord todaysWord;
  const Daily({required this.todaysWord, super.key});

  @override
  State<Daily> createState() => _DailyState();
}

class _DailyState extends State<Daily> {
  late TodaysWord word;
  String? formattedDate;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    getDate();
    word = widget.todaysWord;
  }

  getDate() {
    var now = DateTime.now();
    var formatter = DateFormat.yMMMMd('fr');
    formattedDate = formatter.format(now);
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                      Column(
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
                                  label: formattedDate.toString(),
                                  color: kDailyMainColor)
                            ],
                          ),
                          const SizedBox(height: kDefaultSize * 3),
                          Container(
                            decoration: const BoxDecoration(
                              color: kWhite,
                              borderRadius: BorderRadius.all(
                                Radius.circular(kBorderRadiusDefault),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                          ),
                          const SizedBox(height: kDefaultSize * 3),
                          MainButton(
                              label: 'Jouer',
                              style: kPlayButton,
                              color: kCTAColor,
                              onPressed: () {
                                // TODO: Navigate to DailyLevel
                                // Navigator.push<void>(
                                //   context,
                                //   MaterialPageRoute<void>(
                                //     builder: (BuildContext context) =>
                                //         DailyLevel(
                                //             title: formattedDate.toString(),
                                //             word: dailyWord,
                                //             color: kDailyMainColor),
                                //   ),
                                // );
                              }),
                          const SizedBox(height: kDefaultSize * 30),
                        ],
                      ),
                    ]))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
