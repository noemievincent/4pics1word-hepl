import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../styles/constants.dart';

class BackArrowIcon extends StatelessWidget {
  const BackArrowIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SvgPicture.asset('assets/icons/topbar/back-arrow.svg',
          height: kDefaultSize * 8, color: kSecondaryTextColor),
      onTap: () {
        Navigator.of(context).popUntil((route) => route.isFirst);
      },
    );
  }
}
