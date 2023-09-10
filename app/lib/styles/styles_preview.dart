import 'package:flutter/material.dart';
import 'constants.dart';

class StylesPreview extends StatelessWidget {
  const StylesPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDefaultBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      color: kLettersBackgroundColor,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: kDefaultSize),
                    Container(
                      color: kUsedLettersBackgroundColor,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: kDefaultSize),
                    Container(
                      color: kDailyBackgroundColor,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: kDefaultSize),
                    Container(
                      color: kDailyTodayBackgroundColor,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: kDefaultSize),
                    Container(
                      color: kTimerBackgroundColor,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: kDefaultSize),
                    Container(
                      color: kLessImageBackgroundColor,
                      width: 20,
                      height: 20,
                    ),
                  ],
                ),
                const Text(
                  "Glossaire",
                  style: kTitleStyle,
                ),
                const Text(
                  "400",
                  style: kMoneyStyle,
                ),
                const Row(
                  children: [
                    Text(
                      "Accueil",
                      style: kNavBarItemsActiveStyle,
                    ),
                    Text(
                      "Mot du jour",
                      style: kNavBarItemsStyle,
                    ),
                  ],
                ),
                const Text(
                  "A B C D",
                  style: kGlossaryNavigationStyle,
                ),
                const Text(
                  "Abeille",
                  style: kWordCardTitleStyle,
                ),
                const Text(
                  "nom féminin",
                  style: kWordCardCategoryStyle,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "1.",
                      style: kWordCardDefinitionNumberStyle,
                    ),
                    Expanded(
                      child: Text(
                        "Insecte vivant en colonies et produisant la cire et le miel.",
                        style: kWordCardDefinitionStyle,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      "15",
                      style: kCalendarPastDaysStyle,
                    ),
                    Text(
                      "16",
                      style: kCalendarTodayStyle,
                    ),
                    Text(
                      "17",
                      style: kCalendarPastDaysStyle,
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      "3",
                      style: kHintNumberStyle,
                    ),
                    Text(
                      "retirer des letters",
                      style: kHintNameStyle,
                    ),
                  ],
                ),
                const Text(
                  "S",
                  style: kSelectedLettersStyle,
                ),
                const Text(
                  "A",
                  style: kGlossaryHeaderStyle,
                ),
                const Text(
                  "Niveau 22",
                  style: kPillTitleStyle,
                ),
                const Text(
                  "Niveau 22",
                  style: kLevelTitleStyle,
                ),
                const Text(
                  "Jouer",
                  style: kPlayButton,
                ),
                const Text(
                  "16 Novembre 2022",
                  style: kDateStyle,
                ),
                const Text(
                  "Devinez un nouveau mot et gagnez chaque jour un bonus !",
                  style: kDailyTaglineStyle,
                ),
                const Text(
                  "Mot du jour",
                  style: kDailyWordButtonStyle,
                ),
                const Text(
                  "Timer",
                  style: kTimerTitleStyle,
                ),
                const Text(
                  "Moins d'images",
                  style: kLessImageTitleStyle,
                ),
                const Text(
                  "Jouer",
                  style: kChallengesButtonStyle,
                ),
                const Text(
                  "Abeille",
                  style: kGlossaryWordStyle,
                ),
                const Text(
                  "Confirmation du joker",
                  style: kSettingsStyle,
                ),
                const Text(
                  "Connectez-vous et sauvegardez votre progression ! Vous pourrez ensuite accéder à votre score sur d’autres appareils",
                  style: kSettingsTaglineStyle,
                ),
                const Text(
                  "Connecter à Facebook",
                  style: kLightSocialButtonStyle,
                ),
                const Text(
                  "Déconnecter",
                  style: kLogoutButtonStyle,
                ),
                const Text(
                  "Supprimer le compte",
                  style: kDeleteAccountButtonStyle,
                ),
                const Text(
                  "Connecté avec Apple",
                  style: kConnectedStyle,
                ),
                const Text(
                  "A B C D",
                  style: kAvailableLettersStyle,
                ),
                const Text(
                  "Demander à un ami",
                  style: kAskAFriendButtonStyle,
                ),
                const Text(
                  "Abeille",
                  style: kWordCardTitleStyle,
                ),
                const Text(
                  "Bloqué ? Demandez de l’aide à vos amis !",
                  style: kSubtileStyle,
                ),
                const Text(
                  "Révéler une lettre",
                  style: kConfirmHintTitleStyle,
                ),
                const Text(
                  "Souhaitez-vous révéler une lettre correcte ?",
                  style: kHintDetailStyle,
                ),
                const Row(
                  children: [
                    Text(
                      "Oui",
                      style: kConfirmHintButtonPrimaryStyle,
                    ),
                    Text(
                      "Non",
                      style: kConfirmHintButtonSecondaryStyle,
                    ),
                  ],
                ),
                const Text(
                  "Révéler une lettre",
                  style: kBuyHintTitleStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
