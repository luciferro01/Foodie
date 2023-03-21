import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/color.dart';
import '../constant/styles.dart';
import 'account_screen.dart';

class OrgDetails extends StatelessWidget {
  final String image;
  final String name;
  const OrgDetails({super.key, required this.image, required this.name});

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              // margin: EdgeInsets.only(
              //   top: 40,
              //   left: 10,
              //   right: 10,
              //   bottom: 10,
              // ),
              height: MediaQuery.of(context).size.height * 0.26,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
              ),
              child: Image.network(image, fit: BoxFit.fill),
            ),
            Text(
              name,
              style: labelTextStyle,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: primaryCircleColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Ever since its inception in 2008, UDAAN- A Youth Organization has been actively seeking to promote the importance of Life skills. Our team work to make Life skills simpler, cost-effectiv and easily available. Through its team, UDAAN- A Youth Organization is continuously working towards empowering young underprivileged students by providing them life skills program that promotes positive values, healthy habits, and education. UDAAN addresses a variety of issues, such as Soft Skills, English Communication, Public Speaking, Career, Goal-setting, Leadership, and so on. So far, UDAAN has successfully conducted many workshops, seminars and counselling sessions for over 6 ',
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: mainColor,
                foregroundColor: Colors.transparent,
              ),
              onPressed: () {},
              child: Text(
                'Donate Now',
                style: labelTextStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
