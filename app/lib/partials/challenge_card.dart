import 'package:flutter/material.dart';

import '../styles/constants.dart';

class ChallengeCard extends StatelessWidget {
  final Widget title;
  final Widget middleElement;
  final Widget button;
  final bool withGap;

  const ChallengeCard(
      {required this.title,
      required this.middleElement,
      required this.button,
      this.withGap = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.all(
            Radius.circular(kBorderRadiusDefault),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultSize * 6.5, vertical: kDefaultSize * 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              title,
              if (withGap) ...[
                const SizedBox(height: kDefaultSize * 2),
              ],
              middleElement,
              if (withGap) ...[
                const SizedBox(height: kDefaultSize * 5),
              ],
              button
            ],
          ),
        ));
  }
}
