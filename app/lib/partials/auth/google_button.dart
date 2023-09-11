import 'package:flutter/material.dart';

import '../../styles/constants.dart';
import '../buttons/account_button.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AccountButton(
        color: kGoogleButtonColor,
        textStyle: kDarkSocialButtonStyle,
        icon: 'assets/icons/socials/google.svg',
        label: 'Google',
        iconColor: kSecondaryTextColor);
  }
}