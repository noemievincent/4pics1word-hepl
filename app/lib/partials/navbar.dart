import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../styles/constants.dart';

class NavBar extends StatefulWidget {
  final int index;
  final void Function(int) onTapped;

  const NavBar({required this.index, required this.onTapped, Key? key})
      : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: kNavBarColor,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusLarge)),
      child: Padding(
        padding: const EdgeInsets.only(top: kDefaultSize),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedItemColor: kCTAColor,
          unselectedItemColor: kNavBarItemsColor,
          currentIndex: widget.index,
          onTap: widget.onTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/navbar/grid.svg',
                  height: kDefaultSize * 7, color: kNavBarItemsColor),
              activeIcon: SvgPicture.asset('assets/icons/navbar/grid.svg',
                  height: kDefaultSize * 7, color: kCTAColor),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/navbar/calendar.svg',
                  height: kDefaultSize * 7, color: kNavBarItemsColor),
              activeIcon: SvgPicture.asset('assets/icons/navbar/calendar.svg',
                  height: kDefaultSize * 7, color: kCTAColor),
              label: 'Mot du jour',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/navbar/books.svg',
                  height: kDefaultSize * 7, color: kNavBarItemsColor),
              activeIcon: SvgPicture.asset('assets/icons/navbar/books.svg',
                  height: kDefaultSize * 7, color: kCTAColor),
              label: 'Glossaire',
            ),
          ],
        ),
      ),
    );
  }
}
