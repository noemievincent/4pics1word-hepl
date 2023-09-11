import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../styles/constants.dart';

class Money extends StatelessWidget {
  const Money({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(kBorderRadiusLarge),
        ),
        color: kWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultSize * 2, vertical: kDefaultSize),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset('assets/icons/topbar/euro-coin.svg',
                height: kDefaultSize * 6, color: kMoneyColor),
            const SizedBox(width: kDefaultSize * 1.2),
            const Text("100", style: kMoneyStyle)
          ],
        ),
      ),
    );
  }
}
