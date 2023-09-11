import 'package:flutter/material.dart';

import '../../styles/constants.dart';
import '../buttons/account_button.dart';


class AppleButton extends StatelessWidget {
  const AppleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AccountButton(
        color: kAppleButtonColor,
        textStyle: kLightSocialButtonStyle,
        icon: 'assets/icons/socials/apple.svg',
        label: 'Apple',
        iconColor: kWhite);
  }
}
