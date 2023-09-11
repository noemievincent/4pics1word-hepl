import 'package:app/partials/icons/close_icon.dart';
import 'package:app/partials/images/images_grid.dart';
import 'package:flutter/material.dart';

import '../models/word.dart';
import '../partials/buttons/share_button.dart';
import '../partials/topbar/topbar.dart';
import '../styles/constants.dart';

class WordDetail extends StatelessWidget {
  final Word word;

  const WordDetail({required this.word, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDefaultBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopBar(
                      title: word.word,
                      titleStyle: kTitleStyle,
                      rightItem: const CloseIcon()),
                  const SizedBox(height: kDefaultSize * 3),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kHorizontalSpacer),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: kDefaultSize),
                        ImagesGrid(images: word.images, isInteractive: true),
                        const SizedBox(height: kDefaultSize * 3),
                        Text(
                          word.category,
                          style: kWordCardCategoryStyle,
                        ),
                        const SizedBox(height: kDefaultSize),
                        Column(
                          children: [
                            for (var i = 0;
                                i < word.definitions.length;
                                ++i) ...[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${i + 1}.',
                                      style: kWordCardDefinitionNumberStyle),
                                  const SizedBox(width: kDefaultSize * 2),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 60,
                                    child: Text(word.definitions[i],
                                        style: kWordCardDefinitionStyle,
                                        softWrap: true),
                                  ),
                                ],
                              ),
                              const SizedBox(height: kDefaultSize * 3),
                            ],
                          ],
                        ),
                        const SizedBox(height: kDefaultSize * 6),
                        Column(
                          children: [
                            const Text("Partager avec vos amis",
                                style: kShareTitleStyle),
                            const SizedBox(height: kDefaultSize * 3),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultSize * 11),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  ShareButton(
                                      color: kFacebookButtonColor,
                                      icon:
                                          'assets/icons/socials/facebook.svg'),
                                  ShareButton(
                                      color: kTwitterButtonColor,
                                      icon: 'assets/icons/socials/twitter.svg'),
                                  ShareButton(
                                      color: kCTAColor,
                                      icon: 'assets/icons/socials/link.svg'),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: kDefaultSize * 8),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: const NavBar(),
    );
  }
}
