import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../styles/constants.dart';
import 'indicator.dart';

class Hint extends StatelessWidget {
  final String icon;
  const Hint({required this.icon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: kDefaultSize * 2, right: kDefaultSize * 2),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: kHintBackgroundColor.withOpacity(0.7),
              borderRadius: const BorderRadius.all(
                Radius.circular(kBorderRadiusDefault),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: SvgPicture.asset(icon, color: kSecondaryTextColor),
            ),
          ),
        ),
        const Indicator(),
      ],
    );
  }
}
