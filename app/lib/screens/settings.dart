import 'package:app/partials/icons/close_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../partials/auth/apple_button.dart';
import '../partials/auth/facebook_button.dart';
import '../partials/auth/google_button.dart';
import '../partials/buttons/small_button.dart';
import '../partials/setting_item.dart';
import '../partials/topbar/topbar.dart';
import '../styles/constants.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var labels = [
    "Son",
    "Confirmation du joker",
    "Notifications avec des indices gratuits",
    "Notifications de l‘énigme journalière"
  ];

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
                  const TopBar(
                      title: "Paramètres",
                      titleStyle: kTitleStyle,
                      rightItem: CloseIcon()),
                  const SizedBox(height: kDefaultSize * 3),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kHorizontalSpacer),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: kDefaultSize),
                        Column(
                          children: [
                            for (var label in labels) ...[
                              SettingItem(label: label),
                              const SizedBox(height: kDefaultSize * 4)
                            ],
                          ],
                        ),
                        Divider(
                            thickness: kDefaultSize / 3,
                            height: kDefaultSize * 10,
                            color: kMainTextColor.withOpacity(0.4)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Gérer le compte",
                                style: kSettingsStyle),
                            const SizedBox(height: kDefaultSize),
                            const Text(
                              "Connectez-vous et sauvegardez votre progression ! Vous pourrez ensuite accéder à votre score sur d’autres appareils",
                              style: kSettingsTaglineStyle,
                            ),
                            const SizedBox(height: kDefaultSize * 3),
                            Wrap(runSpacing: kDefaultSize * 2, children: const [
                              FacebookButton(),
                              AppleButton(),
                              GoogleButton()
                            ]),
                            const SizedBox(height: kDefaultSize * 6),
                            Column(children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                        'assets/icons/socials/apple.svg',
                                        color: kAppleButtonColor),
                                    const SizedBox(width: kDefaultSize),
                                    const Text("Connecté avec Apple")
                                  ]),
                              const SizedBox(height: kDefaultSize * 2),
                              const SmallButton(
                                  label: "Déconnecter",
                                  style: kLogoutButtonStyle,
                                  color: kSecondaryButtonColor),
                              const SizedBox(height: kDefaultSize * 3),
                              const SmallButton(
                                  label: "Supprimer le compte",
                                  style: kDeleteAccountButtonStyle,
                                  color: kCTAColor),
                            ]),
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
