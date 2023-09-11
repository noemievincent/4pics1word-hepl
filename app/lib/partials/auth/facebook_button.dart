import 'package:flutter/material.dart';

import '../../styles/constants.dart';
import '../buttons/account_button.dart';

class FacebookButton extends StatelessWidget {
  const FacebookButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AccountButton(
        color: kFacebookButtonColor,
        textStyle: kLightSocialButtonStyle,
        icon: 'assets/icons/socials/facebook.svg',
        label: 'Facebook',
        iconColor: kWhite);
  }
}
