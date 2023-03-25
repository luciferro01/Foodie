import 'package:flutter/material.dart';
import 'package:foodie/authentication/authentication_home_screen.dart';
import 'package:foodie/constant/color.dart';
import 'package:foodie/constant/styles.dart';
import '../models/account_items_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: must_be_immutable
class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});
  List<AccountItems> items = [
    AccountItems(
      icon: Icons.account_circle_rounded,
      onpressed: () {},
      title: 'My Profile',
    ),
    AccountItems(
      icon: Icons.history_sharp,
      onpressed: () {},
      title: 'History',
    ),
    AccountItems(
      icon: Icons.settings,
      onpressed: () {},
      title: 'Setting',
    ),
    AccountItems(
      icon: Icons.contact_support_rounded,
      onpressed: () {},
      title: 'Contact',
    ),
    AccountItems(
      icon: Icons.share,
      onpressed: () {},
      title: 'Share',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: softWhite,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Stack(
                children: [
                  Positioned(
                    top: -200,
                    child: Container(
                      width: MediaQuery.of(context).size.height * 0.5,
                      height: MediaQuery.of(context).size.height * 0.54,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.width * 0.09,
                    left: MediaQuery.of(context).size.width * 0.33,
                    child: Image.asset("assets/images/foodie_logo.png"),
                  ),
                  Positioned(
                    bottom: 0,
                    left: MediaQuery.of(context).size.width * 0.34,
                    child: Text(
                      'Hello !! User',
                      style: labelTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            ...items.map((e) {
              return Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xfff4f8fb),
                    boxShadow: const [
                      BoxShadow(color: softWhite, blurRadius: 6),
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 0.1,
                        blurStyle: BlurStyle.outer,
                        // offset: Offset(2, 4),
                      )
                    ]),
                margin: const EdgeInsets.only(
                  left: 35,
                  bottom: 20,
                  right: 35,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(e.icon, color: Colors.black, size: 40),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.06,
                        ),
                        Text(
                          e.title,
                          style: labelTextStyle,
                        )
                      ],
                    ),
                    const Icon(
                      Icons.navigate_next_rounded,
                      color: Colors.black,
                      size: 40,
                    ),
                  ],
                ),
              );
            }),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: mainColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
              ),
              onPressed: () {
                FirebaseAuth auth = FirebaseAuth.instance;
                auth.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const AuthScreen();
                    },
                  ),
                );
              },
              child: Text(
                'Log Out',
                style: labelTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget AccountScreenItems = {return Container()};
}


// Container(margin: const EdgeInsets.all(10), child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [Icon(e.icon), Text(e.title, style: labelTextStyle,)],))