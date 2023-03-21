import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:foodie/constant/color.dart';
import 'package:foodie/screens/account_screen.dart';
import 'package:foodie/screens/home_screen.dart';

import 'donate_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  List screens = [HomeScreen(), DonateScreen(), AccountScreen()];
  int activeScreen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[activeScreen],
      bottomNavigationBar: CurvedNavigationBar(
          // buttonBackgroundColor: mainColor,

          color: secondaryColor,
          height: 60,
          index: 0,
          // animationCurve: ,
          buttonBackgroundColor: softWhite,
          backgroundColor: primaryCircleColor,
          items: [
            const Icon(
              Icons.home_filled,
              color: Colors.black,
              size: 30,
            ),
            // Icon(
            //   Icons.abc,
            //   color: Colors.black,
            //   size: 30,
            // ),
            Image.asset(
              "assets/icons/donate.png",
            ),
            const Icon(
              Icons.account_circle_rounded,
              color: Colors.black,
              size: 30,
            ),
          ],
          // icons: [Icons.home_filled, Icons.abc, Icons.account_circle_rounded],
          // activeIndex: 0,
          onTap: (index) {
            setState(() {
              activeScreen = index;
            });
          }),
    );
  }
}
