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
          actions: const [
            Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.account_circle_rounded,
                color: Colors.black,
                size: 40,
              ),
            ),
          ],
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              margin: const EdgeInsets.only(right: 35),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(0),
                  icon: const Icon(Icons.search),
                  hintText: 'Search Anything',
                  // border: BorderRadius.circular(20)),
                  // border:
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      style: BorderStyle.solid,
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  hintStyle: fadedTextStyle,
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.black,
                  // prefixStyle: TextStyle(color: Colors.black),
                ),
                style: labelTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
