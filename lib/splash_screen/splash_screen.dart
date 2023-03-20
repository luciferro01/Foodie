import 'dart:async';
import 'package:flutter/material.dart';
import '../onboarding_screen/screen/onborading_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;
  @override
  void initState() {
    timer = Timer(
      const Duration(seconds: 2),
      (() => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const OnboardingScreen(),
            ),
          )),
    );
    super.initState();
  }

  @override
  void dispose() {
    timer;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFB9F3FC),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/foodie_logo.png",
              width: MediaQuery.of(context).size.width * 0.4,
              // height: 200,
              // width: 200,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Hero(
              tag: 'App Name',
              child: Text(
                "Super App",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
