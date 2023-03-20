import 'package:flutter/material.dart';
import 'package:foodie/constant/color.dart';
import 'package:foodie/constant/styles.dart';
import 'package:google_fonts/google_fonts.dart';

enum card { donate, ngo }

class Registeration extends StatefulWidget {
  Registeration({super.key});

  @override
  State<Registeration> createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  Color inactive = Colors.transparent;
  Color active = secondaryColor;
  card selectedCard = card.ngo;

  bool selectedDonate = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: GoogleFonts.poppins(),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(gradient: mainScreenColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Text('Tells us about yourself', style: highlightedTextStyle),
                Text('Choose what you like', style: fadedTextStyle),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // crossAxisAlignment: CrossAxisAlignment.,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCard = card.donate;
                            });
                          },
                          child: CircleAvatar(
                            radius: 44,
                            backgroundColor:
                                selectedCard == card.donate ? active : inactive,
                            child: Image.asset('assets/icons/donate.png'),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'Donate',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'Want to Donate food',
                          style: GoogleFonts.poppins(
                              color: fadedColor, fontSize: 16),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCard = card.ngo;
                            });
                          },
                          child: CircleAvatar(
                            radius: 44,
                            backgroundColor:
                                selectedCard == card.ngo ? active : inactive,
                            child: Image.asset('assets/icons/ngo.png'),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'NGO',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'Need some food',
                          style: GoogleFonts.poppins(
                              color: fadedColor, fontSize: 16),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Image.asset('assets/images/need_some_food.png'),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: const BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(80),
                          topRight: Radius.circular(80),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: MediaQuery.of(context).size.height * 0.02,
                      left: MediaQuery.of(context).size.height * 0.14,
                      child: Text(
                        'I need some Food',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
