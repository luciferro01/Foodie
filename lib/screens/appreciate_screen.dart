import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/color.dart';
import '../constant/styles.dart';
import 'account_screen.dart';

class AppreciateScreen extends StatelessWidget {
  const AppreciateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softWhite,
      appBar: AppBar(
        backgroundColor: mainColor,
        automaticallyImplyLeading: false,
        leading: Container(
          margin: const EdgeInsets.all(10),
          child: CircleAvatar(
            child: Image.asset(
              'assets/images/foodie_logo.png',
            ),
          ),
        ),
        title: Text(
          'FOODIES',
          style: labelTextStyle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AccountScreen();
                    },
                  ),
                );
              },
              icon: const Icon(
                Icons.account_circle_rounded,
                color: Colors.black,
                size: 40,
              ),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon(
            //   Icons.,
            //   color: Colors.black,
            //   size: MediaQuery.of(context).size.height * 0.4,
            // ),
            Text(
              'Donation',
              style: GoogleFonts.poppins(color: Colors.black, fontSize: 50),
            ),
            Text(
              'Registered',
              style: labelTextStyle,
            ),
            Text(
              'Successfully',
              style: labelTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
