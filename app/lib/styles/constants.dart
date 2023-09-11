import 'package:flutter/material.dart';

// Darken or Lighten color
// code from : https://stackoverflow.com/questions/58360989/programmatically-lighten-or-darken-a-hex-color-in-dart#:~:text=//%20ranges%20from%200.0,.3)%3B
Color darken(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

Color lighten(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

  return hslLight.toColor();
}

const kWhite = Color(0xFFFFFFFF);
const kLoadingImageBackground = Color(0xFFC9C9C9);
const kMainTextColor = Color(0xFF162B76);
const kSecondaryTextColor = Color(0xFF413E46);
const kNavBarColor = Color(0xFFF5F5F5);
const kNavBarItemsColor = Color(0xFFAFAFAF);
const kCTAColor = Color(0xFFFC9434);
const kSecondaryButtonColor = Color(0xFFF4F1EF);

const kOverlayBackgroundColor = Color(0xE6010514);

const kLettersBackgroundColor = Color(0xFFFDFCFB);
const kUsedLettersBackgroundColor = Color(0xFFCACAC9);
const kLettersTextColor = Color(0xFF45463E);

const kHintBackgroundColor = Color(0xFFFDFCFB);

const kDefaultBackgroundColor = Color(0xFFE1E7FE);
const kDefaultMainColor = Color(0xFF849BEB);
const kGlossaryHeaderColor = Color(0xFF99A9E2);

const kDailyBackgroundColor = Color(0xFFD8D2FD);
const kDailyMainColor = Color(0xFF927EE3);
const kDailyNavigationColor = Color(0xFF695EAE);
const kDailyPastDaysColor = Color(0xFF51478B);
const kDailyComingDaysColor = Color(0xFFB3A9F1);
const kDailyTodayBackgroundColor = Color(0xFFB3A9F1);

const kTimerBackgroundColor = Color(0xFFDEE8B9);
const kTimerMainColor = Color(0xFFADCC30);

const kLessImageBackgroundColor = Color(0xFFFACBE1);
const kLessImageMainColor = Color(0xFFEB8DBA);

const kFacebookButtonColor = Color(0xFF4267B2);
const kTwitterButtonColor = Color(0xFF1DA1F2);
const kAppleButtonColor = Color(0xFF333133);
const kGoogleButtonColor = Color(0xFFFFFFFF);

const kMoneyColor = Color(0xFFDEA30B);

const kFailColor = Color(0xFFE52525);

const double kDefaultSize = 4;
const double kHorizontalSpacer = 16;
const double kVerticalSpacer = 24;

const double kBorderRadiusFull = 40;
const double kBorderRadiusLarge = 20;
const double kBorderRadiusDefault = 10;
const double kBorderRadiusSmall = 6;

const double kXXSFontSize = 12.0;
const double kXSFontSize = 14.0;
const double kSmallFontSize = 16.0;
const double kBaseFontSize = 18.0;
const double kMediumFontSize = 20.0;
const double kLargeFontSize = 24.0;
const double kXLFontSize = 26.0;
const double kXXLFontSize = 28.0;

const kMoneyStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kSecondaryTextColor,
  fontSize: kSmallFontSize,
  decoration: TextDecoration.none,
);

const kDateStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kDailyMainColor,
  fontSize: kXXLFontSize,
  decoration: TextDecoration.none,
);

const kDailyTaglineStyle = TextStyle(
  fontWeight: FontWeight.w200,
  color: kDailyMainColor,
  fontSize: kSmallFontSize,
  decoration: TextDecoration.none,
);

//Styles : Title
const kTitleStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kMainTextColor,
  fontSize: 30.0,
  decoration: TextDecoration.none,
);

const kSuccessTitleStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kWhite,
  fontSize: 40.0,
  decoration: TextDecoration.none,
);

const kSubtileStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kWhite,
  fontSize: kLargeFontSize,
  decoration: TextDecoration.none,
);

const kShareTitleStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kMainTextColor,
  fontSize: kLargeFontSize,
  decoration: TextDecoration.none,
);

const kTimerTitleStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kTimerMainColor,
  fontSize: kLargeFontSize,
  decoration: TextDecoration.none,
);

const kLessImageTitleStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kLessImageMainColor,
  fontSize: kBaseFontSize,
  decoration: TextDecoration.none,
);

const kPillTitleStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kWhite,
  fontSize: kSmallFontSize,
  decoration: TextDecoration.none,
);

const kLevelTitleStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kWhite,
  fontSize: kBaseFontSize,
  decoration: TextDecoration.none,
);

//Styles : Buttons
const kPlayButton = TextStyle(
  fontWeight: FontWeight.w400,
  color: kWhite,
  fontSize: kXXLFontSize,
  decoration: TextDecoration.none,
);

const kDailyWordButtonStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kWhite,
  fontSize: kLargeFontSize,
  decoration: TextDecoration.none,
);

const kChallengesButtonStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kWhite,
  fontSize: kBaseFontSize,
  decoration: TextDecoration.none,
);

//Styles : NavBarItems
const kNavBarItemsStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kNavBarItemsColor,
  fontSize: 10.0,
  decoration: TextDecoration.none,
);
const kNavBarItemsActiveStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kCTAColor,
  fontSize: 10.0,
  decoration: TextDecoration.none,
);

//Styles : Glossary
const kGlossaryNavigationStyle = TextStyle(
  fontWeight: FontWeight.w200,
  color: kMainTextColor,
  fontSize: kXSFontSize,
  decoration: TextDecoration.none,
);

const kGlossaryHeaderStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kWhite,
  fontSize: kLargeFontSize,
  decoration: TextDecoration.none,
);

const kGlossaryWordStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kMainTextColor,
  fontSize: kBaseFontSize,
  decoration: TextDecoration.none,
);

const kEmptyGlossaryTextStyle = TextStyle(
  fontWeight: FontWeight.w200,
  color: kMainTextColor,
  fontSize: kBaseFontSize,
  decoration: TextDecoration.none,
);

const kEmptyGlossaryLinkStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kCTAColor,
  fontSize: kBaseFontSize,
  decoration: TextDecoration.none,
);

//Styles : Calendar
const kCalendarPastDaysStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kDailyPastDaysColor,
  fontSize: kXXSFontSize,
  decoration: TextDecoration.none,
);
const kCalendarComingDaysStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kDailyComingDaysColor,
  fontSize: kXXSFontSize,
  decoration: TextDecoration.none,
);
const kCalendarTodayStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kWhite,
  fontSize: kXXSFontSize,
  decoration: TextDecoration.none,
);

//Styles : Hint
const kHintNumberStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kWhite,
  fontSize: kXXSFontSize,
  decoration: TextDecoration.none,
);

const kHintNameStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kSecondaryTextColor,
  fontSize: kXXSFontSize,
  decoration: TextDecoration.none,
);

const kAskAFriendButtonStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kWhite,
  fontSize: kBaseFontSize,
  decoration: TextDecoration.none,
);

const kConfirmHintTitleStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kMainTextColor,
  fontSize: kXLFontSize,
  decoration: TextDecoration.none,
);

const kHintDetailStyle = TextStyle(
  fontWeight: FontWeight.w200,
  color: kMainTextColor,
  fontSize: kBaseFontSize,
  decoration: TextDecoration.none,
);

const kConfirmHintButtonPrimaryStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kWhite,
  fontSize: kXLFontSize,
  decoration: TextDecoration.none,
);

const kConfirmHintButtonSecondaryStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kSecondaryTextColor,
  fontSize: kXLFontSize,
  decoration: TextDecoration.none,
);

const kBuyHintTitleStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kSecondaryTextColor,
  fontSize: kXXSFontSize,
  decoration: TextDecoration.none,
);

//Styles : Letters
const kSelectedLettersStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kWhite,
  fontSize: kXXLFontSize,
  decoration: TextDecoration.none,
);

const kAvailableLettersStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kSecondaryTextColor,
  fontSize: kXXLFontSize,
  decoration: TextDecoration.none,
);

//Styles : WordCard
const kWordCardCategoryStyle = TextStyle(
  fontWeight: FontWeight.w200,
  fontStyle: FontStyle.italic,
  color: kMainTextColor,
  fontSize: kSmallFontSize,
  decoration: TextDecoration.none,
);
const kWordCardDefinitionStyle = TextStyle(
  fontWeight: FontWeight.w200,
  color: kMainTextColor,
  fontSize: kBaseFontSize,
  decoration: TextDecoration.none,
);
const kWordCardDefinitionNumberStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kCTAColor,
  fontSize: kBaseFontSize,
  decoration: TextDecoration.none,
);

const kWordCardTitleStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kMainTextColor,
  fontSize: kXXLFontSize,
  decoration: TextDecoration.none,
);

//Styles : Settings
const kSettingsStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kMainTextColor,
  fontSize: kMediumFontSize,
  decoration: TextDecoration.none,
);

const kSettingsTaglineStyle = TextStyle(
  fontWeight: FontWeight.w200,
  color: kMainTextColor,
  fontSize: kSmallFontSize,
  decoration: TextDecoration.none,
);

const kLightSocialButtonStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kWhite,
  fontSize: kMediumFontSize,
  decoration: TextDecoration.none,
);

const kDarkSocialButtonStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kSecondaryTextColor,
  fontSize: kMediumFontSize,
  decoration: TextDecoration.none,
);

//Styles : ConnectedAccount
const kLogoutButtonStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kSecondaryTextColor,
  fontSize: kBaseFontSize,
  decoration: TextDecoration.none,
);
const kDeleteAccountButtonStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kWhite,
  fontSize: kBaseFontSize,
  decoration: TextDecoration.none,
);
const kConnectedStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: kSecondaryTextColor,
  fontSize: kBaseFontSize,
  decoration: TextDecoration.none,
);
