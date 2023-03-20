import 'package:flutter/material.dart';
import 'package:foodie/constant/color.dart';
import 'package:foodie/constant/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          centerTitle: true,
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.1,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                )
              ],
            ),
            // ListView.builder(
            //   itemCount: 3,
            //   itemBuilder: (BuildContext context, int index) {},
            // ),
          ],
        ),
      ),
    );
  }
}
